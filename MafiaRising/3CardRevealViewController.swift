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
    //@IBOutlet weak var bypassBtn: UIButton!
    
    // may delete if stupid
    @IBOutlet weak var portraitHelper: UIImageView!
    
    // Transfer Index Array
    var masterIndexArray: Array<Int> = []
    
    var captureSession = AVCaptureSession()
    var sessionOutput = AVCapturePhotoOutput()
    var previewLayer = AVCaptureVideoPreviewLayer()
    
    // Master Player Array Official Instantiation
    var masterPlayerArray: Array<Player> = []
    
    // Disable Pause->Roles
    var fakeMasterPlayerArray: Array<Player> = []
    
    // Count variable
    var playerIndexCount: Int = 0
    
    // Set bounds of camera view
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = cameraView.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //bypassBtn.isHidden = false; // comment out for final product
        
        // Add Borders to camera and portrait view
        playerImage.layer.borderWidth = 3
        cameraView.layer.borderWidth = 3
        
        // test previous segue and global variables
        print("\(masterIndexArray)")
        print("\(policeExist)")
        print("\(doctorExist)")
        
        updateRoleLbl()
        updateNumberLbl()
        
        //        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        //        switch cameraAuthorizationStatus {
        //        case .denied:
        //            // create alert to ask user to enable camera
        //            createCameraAlert(title: "Please enable your camera.", message: "Additional Message")
        //        case .authorized:
        //            // Begin narration after 1 second
        //            if optionsParameters.enableDirections && !narrationStarted {
        //                print("S_SU_03")
        //                playNarration(trackTitle: "S_SU_03")
        //            }
        //        // restricted, normally won't happen
        //        case .restricted: break
        //
        //        case .notDetermined:
        //            // Prompting user for the permission to use the camera.
        //            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) { granted in
        //                if granted {
        //                    print("Granted access to \(AVMediaTypeVideo)")
        //                } else {
        //                    print("Denied access to \(AVMediaTypeVideo)")
        //                }
        //            }
        //        }
        
        // Set up camera feed
        let deviceSession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInDualCamera,AVCaptureDevice.DeviceType.builtInTelephotoCamera, AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .unspecified)
        
        for device in (deviceSession.devices){
            if device.position == AVCaptureDevice.Position.front {
                do {
                    let input = try AVCaptureDeviceInput(device: device)
                    if captureSession.canAddInput(input) {
                        captureSession.addInput(input)
                        
                        if captureSession.canAddOutput(sessionOutput) {
                            captureSession.addOutput(sessionOutput)
                            
                            previewLayer = AVCaptureVideoPreviewLayer(session:captureSession)
                            previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                            previewLayer.connection?.videoOrientation = .portrait
                            
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if optionsParameters.enableDirections && !narrationStarted {
            print("S_SU_03")
            playNarration(trackTitle: "S_SU_03")
            narrationStarted = false
        }
      /*
        // test previous segue and global variables
        print("\(masterIndexArray)")
        print("\(policeExist)")
        print("\(doctorExist)")
        
        updateRoleLbl()
        updateNumberLbl()
        
//        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
//        switch cameraAuthorizationStatus {
//        case .denied:
//            // create alert to ask user to enable camera
//            createCameraAlert(title: "Please enable your camera.", message: "Additional Message")
//        case .authorized:
//            // Begin narration after 1 second
//            if optionsParameters.enableDirections && !narrationStarted {
//                print("S_SU_03")
//                playNarration(trackTitle: "S_SU_03")
//            }
//        // restricted, normally won't happen
//        case .restricted: break
//            
//        case .notDetermined:
//            // Prompting user for the permission to use the camera.
//            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) { granted in
//                if granted {
//                    print("Granted access to \(AVMediaTypeVideo)")
//                } else {
//                    print("Denied access to \(AVMediaTypeVideo)")
//                }
//            }
//        }
        
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
         */
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "CardsToPause", sender: fakeMasterPlayerArray)
    }

    // Info Button
    @IBAction func goToCardInfo (_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "CardsToInfo", sender: self)
    }
    
    // Proceed Button
    @IBAction func revealNextCard(_ sender: Any) {
        // Play button click sound effect
        playClick()
        
        addPlayer(picture: playerImage.image!, role: roleLbl.text!)
        
        playerIndexCount = playerIndexCount + 1
        
        if playerIndexCount == masterIndexArray.count {
            
            // End capture session
            captureSession.stopRunning()
            previewLayer.removeFromSuperlayer()
            
            // Reset game status
            // Reset cycle
            conclusion = 0
            policeAreAlive = false
            doctorsAreAlive = false
            recentlyMurdered = -1
            firstTimeNight = true
            firstTimeMafia = true
            firstTimePolice = true
            firstTimeDoctor = true
            firstTimeDay = true
            firstTimeTribunal = true
            storyIntroTrackNum = 0
            dayStoryTrackNum = 0
            tribunalTrackNum = 0
            mafiaSelected = -1
            docSelected = -1
            
            cycle = 1
            UserDefaults.standard.set(cycle, forKey: "Cycle")
            part = 0
            UserDefaults.standard.set(part, forKey: "Part")
            currentGameFinished = false
            UserDefaults.standard.set(currentGameFinished, forKey: "CurrentGameFinished")
            
            savedMasterArray = masterPlayerArray
            let data = NSKeyedArchiver.archivedData(withRootObject: savedMasterArray)
            UserDefaults.standard.set(data, forKey: "savedMasterArray")
            
            narrationPlayer.stop()
            narrationStarted = false
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
        // Play button click sound effect
        playClick()
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
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        if cameraAuthorizationStatus != .authorized {
            createCameraAlert(title: "Please enable your camera.", message: "Additional Message")
        } else {
            // Play button click sound effect
            playClick()
            let settings = AVCapturePhotoSettings()
            let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
            let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String : previewPixelType, kCVPixelBufferWidthKey as String : 160, kCVPixelBufferHeightKey as String : 160]
            
            settings.previewPhotoFormat = previewFormat
            sessionOutput.capturePhoto(with: settings, delegate: self)
            
            // Begin narration after 1 second
            if !narrationStarted {
                //narrationPlayer.stop()
                print("S_SU_04")
                playNarration(trackTitle: "S_SU_04")
            }
        }
    }
    
    // Process Picture - iOS11 version
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        if let dataImage = photo.fileDataRepresentation() {
            
            // Old views hidden
            cameraView.isHidden = true
            cameraBtn.isHidden = true
            preNumLbl.isHidden = true
            
            // New views unhidden
            //playerImage.image = UIImage(data: dataImage)
            playerImage.image = resizeImage(image: (UIImage(data: dataImage))!, newWidth: 200)
            playerImage.isHidden = false
            roleLbl.isHidden = false
            numberLbl.isHidden = false
            repeatPictureBtn.isHidden = false
            proceedBtn.isHidden = false
            
            // may delete if stupid
            portraitHelper.isHidden = true
        }
    }
    
    /*
    // Process picture - old version
    func photoOutput(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        
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
    
    }*/
    
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
    
    func createCameraAlert (title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        //Add buttons and actions
        alert.addAction(UIAlertAction(title: "Settings", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print ("Settings")
            UIApplication.shared.open(URL(string: "App-Prefs:root=Privacy&path=CAMERA")!)
        }))
        
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("Okay")
            self.performSegue(withIdentifier: "CardsToHome", sender: self)
        }))
        
        self.present(alert, animated: true, completion: nil)
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
        } else if segue.identifier == "CardsToPause" {
            if let selectedVC = segue.destination as? PauseViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        }
    }
    
 // !!! REMOVE FROM FINAL PRODUCT, FOR TESTING ONLY
    /*@IBAction func bypassPressed(_ sender: Any) {
        // Reset game status
        // Reset cycle
        conclusion = 0
        policeAreAlive = false
        doctorsAreAlive = false
        recentlyMurdered = -1
        firstTimeNight = true
        firstTimeMafia = true
        firstTimePolice = true
        firstTimeDoctor = true
        firstTimeDay = true
        firstTimeTribunal = true
        storyIntroTrackNum = 0
        dayStoryTrackNum = 0
        tribunalTrackNum = 0
        mafiaSelected = -1
        docSelected = -1
        
        cycle = 1
        UserDefaults.standard.set(cycle, forKey: "Cycle")
        part = 0
        UserDefaults.standard.set(part, forKey: "Part")
        currentGameFinished = false
        UserDefaults.standard.set(currentGameFinished, forKey: "CurrentGameFinished")
        
        savedMasterArray = masterPlayerArray
        let data = NSKeyedArchiver.archivedData(withRootObject: savedMasterArray)
        UserDefaults.standard.set(data, forKey: "savedMasterArray")
        
        // !!! populating the master array for testing
        let citImage = UIImage(named: "citizentest")
        let polImage = UIImage(named: "policetest")
        let mafImage = UIImage(named: "mafiatest")
        let docImage = UIImage(named: "doctortest")
        
        for index in 1...masterIndexArray.count {
            if index % 3 == 0 {
                masterPlayerArray.append(Player(picture: mafImage!, role: "MAFIA"))
            } else if index % 11 == 0 {
                masterPlayerArray.append(Player(picture: docImage!, role: "DOCTOR"))
            } else if index % 4 == 0 {
                masterPlayerArray.append(Player(picture: polImage!, role: "POLICE"))
            } else {
                masterPlayerArray.append(Player(picture: citImage!, role: "CITIZEN"))
            }
        }
        performSegue(withIdentifier: "CardsToReady", sender: masterPlayerArray)
    }*/
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
