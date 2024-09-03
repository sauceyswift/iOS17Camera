//
//  FramedCameraPreview.swift
//  Garden Sun Mapper
//
//  Created by Michael Ceryak on 12/10/23.
//

import SwiftUI

struct FramedCameraPreview: View {
    @Bindable var VM: CameraViewModel
    
    var body: some View {
        GeometryReader { geometry in
            CameraPreview(cameraVM: VM, frame: geometry.frame(in: .global))
                .onAppear() {
                    VM.requestAccessAndSetup()
                }
                .ignoresSafeArea()
        }
    }
}
