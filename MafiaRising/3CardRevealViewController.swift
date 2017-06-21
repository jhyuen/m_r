//
//  3CardRevealViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import AVFoundation

class _CardRevealViewController: UIViewController, AVCapturePhotoCaptureDelegate {

    // UI Outlets
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var roleLbl: UILabel!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var repeatPictureBtn: UIButton!
    @IBOutlet weak var proceedBtn: UIButton!
    @IBOutlet weak var preNumLbl: UILabel!
    
    // may delete if stupid
    @IBOutlet weak var portraitHelper: UIImageView!
    
    // Transfer Index Array
    var masterIndexArray: Array<Int> = []
    
    var captureSession = AVCaptureSession()
    var sessionOutput = AVCapturePhotoOutput()
    var previewLayer = AVCaptureVideoPreviewLayer()
    
    // Master Player Array Instantiation
    var masterPlayerArray: Array<Player> = []
    
    // Count variable
    var playerIndexCount: Int = 0
    
    // Set bounds of camera view
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = cameraView.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // test previous segue and global variables
        print("\(masterIndexArray)")
        print("\(policeExist)")
        print("\(doctorExist)")
        
        updateRoleLbl()
        updateNumberLbl()
        
        // Set up camera feed
        let deviceSession = AVCaptureDeviceDiscoverySession(deviceTypes: [.builtInDualCamera,.builtInTelephotoCamera, .builtInWideAngleCamera], mediaType: AVMediaTypeVideo, position: .unspecified)
        
        for device in (deviceSession?.devices)!{
            if device.position == AVCaptureDevicePosition.front {
                do {
                    let input = try AVCaptureDeviceInput(device: device)
                    if captureSession.canAddInput(input) {
                        captureSession.addInput(input)
                        
                        if captureSession.canAddOutput(sessionOutput) {
                            captureSession.addOutput(sessionOutput)
                            
                            previewLayer = AVCaptureVideoPreviewLayer(session:captureSession)
                            previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
                            previewLayer.connection.videoOrientation = .portrait
                            
                            cameraView.layer.addSublayer(previewLayer)
                            
                            // Set up location of camera view
                            previewLayer.position = CGPoint(x: self.cameraView.frame.width/2, y: self.cameraView.frame.height/2)
                            
                            captureSession.startRunning()
                        }
                    }
                } catch let avError {
                    print (avError)
                }
            }
        }
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "CardsToPause", sender: self)
    }

    // Info Button
    @IBAction func goToCardInfo (_ sender: Any) {
        performSegue(withIdentifier: "CardsToInfo", sender: self)
    }
    
    // Proceed Button
    @IBAction func revealNextCard(_ sender: Any) {
        
        addPlayer(picture: playerImage.image!, role: roleLbl.text!)
        
        playerIndexCount = playerIndexCount + 1
        
        if playerIndexCount == masterIndexArray.count {
            
            // End capture session
            captureSession.stopRunning()
            previewLayer.removeFromSuperlayer()
            
            performSegue(withIdentifier: "CardsToReady", sender: masterPlayerArray)
            
        } else {
            
            updateNumberLbl()
            updateRoleLbl()
            
            // Reset views
            cameraView.isHidden = false
            cameraBtn.isHidden = false
            preNumLbl.isHidden = false
            playerImage.isHidden = true
            roleLbl.isHidden = true
            numberLbl.isHidden = true
            repeatPictureBtn.isHidden = true
            proceedBtn.isHidden = true
            
            // may delete if stupid
            portraitHelper.isHidden = false
        }
    }
    
    // Retake picture
    @IBAction func retakePicture(_ sender: Any) {
        
        // Reset views
        cameraView.isHidden = false
        cameraBtn.isHidden = false
        preNumLbl.isHidden = false
        playerImage.isHidden = true
        roleLbl.isHidden = true
        numberLbl.isHidden = true
        repeatPictureBtn.isHidden = true
        proceedBtn.isHidden = true
        
        // may delete if stupid
        portraitHelper.isHidden = false
    }
    
    // Camera Button
    @IBAction func takePhoto(_ sender: Any) {
        
        let settings = AVCapturePhotoSettings()
        let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
        let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String : previewPixelType, kCVPixelBufferWidthKey as String : 160, kCVPixelBufferHeightKey as String : 160]
        
        settings.previewPhotoFormat = previewFormat
        sessionOutput.capturePhoto(with: settings, delegate: self)
    }
    
    // Process picture
    func capture(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhotoSampleBuffer photoSampleBuffer: CMSampleBuffer?, previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        if let sampleBuffer = photoSampleBuffer, let previewBuffer = photoSampleBuffer, let dataImage = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: sampleBuffer, previewPhotoSampleBuffer: previewBuffer) {
                    if error != nil {
                        print("Error")
                        return
                    }
            
            // Old views hidden
            cameraView.isHidden = true
            cameraBtn.isHidden = true
            preNumLbl.isHidden = true
            
            // New views unhidden
            playerImage.image = UIImage(data: dataImage)
            playerImage.isHidden = false
            roleLbl.isHidden = false
            numberLbl.isHidden = false
            repeatPictureBtn.isHidden = false
            proceedBtn.isHidden = false
            
            // may delete if stupid
            portraitHelper.isHidden = true
            
        }
    
    }
    
    // Update number label with current player
    func updateNumberLbl() {
        let counter: String = "\(playerIndexCount + 1)/\(masterIndexArray.count)"
        numberLbl.text = counter
        preNumLbl.text = counter
    }
    
    // Update role label with current player
    func updateRoleLbl() {
        
        var role: String
        
        // 0 = citizen
        if masterIndexArray[playerIndexCount] == 0 {
            role = "CITIZEN"
            // 1 = mafia
        } else if masterIndexArray[playerIndexCount] == 1 {
            role = "MAFIA"
            // 2 = police
        } else if policeExist && masterIndexArray[playerIndexCount] == 2 {
            role = "POLICE"
            // 3 = doctor
        } else if doctorExist && masterIndexArray[playerIndexCount] == 3 {
            role = "DOCTOR"
            // default = citizen
        } else {
            role = "CITIZEN"
        }
        
        roleLbl.text = role
    }
    
    // Create new player and add them to the Master Player Array
    func addPlayer(picture: UIImage, role: String) {
        masterPlayerArray.append(Player(picture: picture, role: role))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CardsToReady" {
            if let selectedVC = segue.destination as? _ReadyViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        }
    }
}
