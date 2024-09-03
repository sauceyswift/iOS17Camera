//
//  CameraPreview.swift
//  Garden Sun Mapper
//
//  Created by Michael Ceryak on 12/10/23.
//

import Foundation
import SwiftUI
import AVFoundation

struct CameraPreview: UIViewRepresentable {
    
    @Bindable var cameraVM: CameraViewModel
    let frame: CGRect
    
    func makeUIView(context: Context) -> UIView {
        let view = UIViewType(frame: frame)
        cameraVM.preview = AVCaptureVideoPreviewLayer(session: cameraVM.session)
        cameraVM.preview.frame = frame
        cameraVM.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(cameraVM.preview)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        cameraVM.preview.frame = frame
        cameraVM.preview.videoGravity = .resizeAspectFill
        cameraVM.preview.connection?.videoRotationAngle = UIDevice.current.orientation.videoRotationAngle
    }
    
}
