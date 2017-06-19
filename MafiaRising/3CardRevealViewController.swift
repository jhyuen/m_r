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

    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var roleLbl: UILabel!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var repeatPictureBtn: UIButton!
    @IBOutlet weak var proceedBtn: UIButton!
    
    // transferred from previous VC
    var masterIndexArray: Array<Int> = []
    
    var captureSession = AVCaptureSession()
    var sessionOutput = AVCapturePhotoOutput()
    var previewLayer = AVCaptureVideoPreviewLayer()
    
    // the master player array
    var masterPlayerArray: Array<Player> = []
    
    // count variable
    // not using loop because does not allow for simple progression
    var playerIndexCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // test previous segue and global variables
        print("\(masterIndexArray)")
        print("\(policeExist)")
        print("\(doctorExist)")
        
        // sets up camera feed
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
         
                            // sets up location of camera view
                            previewLayer.position = CGPoint(x: self.cameraView.frame.width/2, y: self.cameraView.frame.height/2)
        
                            // sets bounds of camera view
                            // previewLayer.frame = playerImage.bounds
         
                            captureSession.startRunning()
                        }
                    }
                } catch let avError {
                    print (avError)
                }
            }
        }
    }
    
    // sets bounds of camera view
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = cameraView.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        addPlayer(picture: playerImage.image!, role: "Citizen")
        
        print("\(playerIndexCount)")
        
        playerIndexCount = playerIndexCount + 1
        
        print("\(playerIndexCount)")
        
        if playerIndexCount == masterIndexArray.count {
            
            // end capture session
            captureSession.stopRunning()
            previewLayer.removeFromSuperlayer()
            
            performSegue(withIdentifier: "CardsToReady", sender: masterPlayerArray)
        }
        
        // Reset views
        cameraView.isHidden = false
        cameraBtn.isHidden = false
        playerImage.isHidden = true
        roleLbl.isHidden = true 
        numberLbl.isHidden = true
        repeatPictureBtn.isHidden = true
        proceedBtn.isHidden = true
        
    }
    
    // Camera Button
    @IBAction func takePhoto(_ sender: Any) {
        
        print("\(playerIndexCount)")
        updateNumberLbl()
        updateRoleLbl()
        
        let settings = AVCapturePhotoSettings()
        let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
        let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String : previewPixelType, kCVPixelBufferWidthKey as String : 160, kCVPixelBufferHeightKey as String : 160]
        
        settings.previewPhotoFormat = previewFormat
        sessionOutput.capturePhoto(with: settings, delegate: self)
    }
    
    // process picture
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
            
            // old views hidden
            cameraView.isHidden = true
            cameraBtn.isHidden = true
            
            // new views unhidden
            playerImage.image = UIImage(data: dataImage)
            playerImage.isHidden = false
            roleLbl.isHidden = false
            numberLbl.isHidden = false
            repeatPictureBtn.isHidden = false
            proceedBtn.isHidden = false
            
        }
    
    }
    
    // retake picture
    @IBAction func retakePicture(_ sender: Any) {
        
        // reset views
        cameraView.isHidden = false
        cameraBtn.isHidden = false
        playerImage.isHidden = true
        roleLbl.isHidden = true
        numberLbl.isHidden = true
        repeatPictureBtn.isHidden = true
        proceedBtn.isHidden = true
    
        /*
        let deviceSession = AVCaptureDeviceDiscoverySession(deviceTypes: [.builtInDualCamera,.builtInTelephotoCamera, .builtInWideAngleCamera], mediaType: AVMediaTypeVideo, position: .unspecified)
        
        for device in (deviceSession?.devices)!{
            if device.position == AVCaptureDevicePosition.front {
                do {
                    let input = try AVCaptureDeviceInput(device: device)
                    if captureSession.canAddInput(input) {
                        captureSession.addInput(input)
                        
                        if captureSession.canAddOutput(sessionOutput) {
                            captureSession.addOutput(sessionOutput)
                            
                            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                            previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
                            previewLayer.connection.videoOrientation = .portrait
                            
                            cameraView.layer.addSublayer(previewLayer)
                            
                            // sets up location of camera view
                            previewLayer.position = CGPoint(x: self.cameraView.frame.width/2, y: self.cameraView.frame.height/2)
                            
                            // sets bounds of camera view
                            // previewLayer.frame = playerImage.bounds
                            
                            captureSession.startRunning()
                        }
                    }
                } catch let avError {
                    print (avError)
                }
            }
        } */
    }
    
    /*
    // shows words and count
    func cardLoop() {
        
        for playerIndex in 0..<masterIndexArray.count {
            
            // call photo code
            
            // CODE BELOW EXECUTES WHEN I PRESS THE BUTTON
            
            updateNumberLbl()
            updateRoleLbl()
            
            // press next button
            
            // create character
            
            // process picture
            
        }
        
    }
     */
    
    // update number label with current player
    func updateNumberLbl() {
        let counter: String = "\(playerIndexCount + 1)/\(masterIndexArray.count)"
        numberLbl.text = counter
    }
    
    // update role label with current player
    func updateRoleLbl() {
        
        var role: String
        
        // 0 = citizen
        if masterIndexArray[playerIndexCount] == 0 {
            role = "Citizen"
            // 1 = mafia
        } else if masterIndexArray[playerIndexCount] == 1 {
            role = "Mafia"
            // 2 = police
        } else if policeExist && masterIndexArray[playerIndexCount] == 2 {
            role = "Police"
            // 3 = doctor
        } else if doctorExist && masterIndexArray[playerIndexCount] == 3 {
            role = "Doctor"
            // default = citizen
        } else {
            role = "Citizen"
        }
        
        roleLbl.text = role
    }
    
    // create new player and add them to the Master Player Array
    func addPlayer(picture: UIImage, role: String) {
        masterPlayerArray.append(Player(picture: picture, role: role))
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
