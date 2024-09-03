//
//  CameraViewModel.swift
//  Garden Sun Mapper
//
//  Created by Michael Ceryak on 12/10/23.
//

import SwiftUI
import AVFoundation

@Observable
class CameraViewModel: NSObject {
    
    enum PhotoCaptureState {
        case notStarted
        case inProgress
        case finished(Data)
        case error(Error)
    }
    
    // MARK: Vars
    
    var didRequestAccessFail: Bool = false
    var isSetup: Bool = false
    
    var session = AVCaptureSession()
    var preview = AVCaptureVideoPreviewLayer()
    var output = AVCapturePhotoOutput()
    
    var photoCaptureState: PhotoCaptureState = .notStarted
    var photoData: Data? {
        switch photoCaptureState {
            case .finished(let data): return data
            default: return nil
        }
    }
    var hasPhoto: Bool { photoData != nil }
    
    
    // MARK: Funcs
    
    func requestAccessAndSetup() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { didAllow in
                if didAllow {
                    self.setUp()
                }
            }
        case .restricted:
            didRequestAccessFail = true
        case .denied:
            didRequestAccessFail = true
        case .authorized:
            setUp()
        @unknown default:
            print("unknown AVCaptureDevice.authorizationStatus value: \(AVCaptureDevice.authorizationStatus(for: .video))")
        }
    }
    
    func setUp() {
        do {
            self.session.beginConfiguration()
            self.session.sessionPreset = AVCaptureSession.Preset.photo
            
            guard let device = AVCaptureDevice.default(for: .video) else { return }
            let input = try AVCaptureDeviceInput(device: device)
            
            guard self.session.canAddInput(input) else { return }
            self.session.addInput(input)
            
            guard self.session.canAddOutput(self.output) else { return }
            self.session.addOutput(self.output)
            
            self.session.commitConfiguration()
            self.isSetup = true
            
            Task(priority: .background) {
                self.session.startRunning()
                await MainActor.run {
                    let orientation = UIDevice.current.orientation
                    self.preview.connection?.videoRotationAngle = orientation.videoRotationAngle
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func takePic() {
        self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
        withAnimation {
            self.photoCaptureState = .inProgress
        }
    }
    
    func retakePic() {
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            DispatchQueue.main.async {
                withAnimation {
                    self.photoCaptureState = .notStarted
                }
            }
        }
    }
    
}
