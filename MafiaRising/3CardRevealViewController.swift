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
    
    // transferred from previous VC
    var masterPlayerArray: Array<Int> = []
    
    var captureSession = AVCaptureSession()
    var sessionOutput = AVCapturePhotoOutput()
    var previewLayer = AVCaptureVideoPreviewLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // test previous segue and global variables
        print("\(masterPlayerArray)")
        print("\(policeExist)")
        print("\(doctorExist)")
    }
    
    // sets bounds of camera view
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = cameraView.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
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
        }
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "CardsToPause", sender: self)
    }

    // Info Button
    @IBAction func goToCardInfo (_ sender: Any) {
        performSegue(withIdentifier: "CardsToInfo", sender: self)
    }
    
    // Camera Button
    @IBAction func takePhoto(_ sender: Any) {
        let settings = AVCapturePhotoSettings()
        let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
        let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String : previewPixelType, kCVPixelBufferWidthKey as String : 160, kCVPixelBufferHeightKey as String : 160]
        
        settings.previewPhotoFormat = previewFormat
        sessionOutput.capturePhoto(with: settings, delegate: self)
    }
    
    // processes picture
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
            
            // end capture session
            captureSession.stopRunning()
            previewLayer.removeFromSuperlayer()
        }
        
    }
    
    @IBAction func retakePicture(_ sender: Any) {
        
        // reset views
        cameraView.isHidden = false
        cameraBtn.isHidden = false
        playerImage.isHidden = true
        roleLbl.isHidden = true
        numberLbl.isHidden = true
        repeatPictureBtn.isHidden = true
    
        /*
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
        }*/
    }
}
