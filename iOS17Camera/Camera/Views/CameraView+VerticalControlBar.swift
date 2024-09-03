//
//  CameraView+VerticalControlBar.swift
//  iOS17Camera
//
//  Created by Michael Ceryak on 1/31/24.
//

import SwiftUI

extension CameraView {
    
    @ViewBuilder var verticalControlBar: some View {
        if VM.photoData != nil {
            verticalControlBarPostPhoto
                .frame(width: controlFrameHeight, alignment: .center)
        } else {
            verticalControlBarPrePhoto
                .frame(width: controlFrameHeight, alignment: .center)
        }
    }
    
    var verticalControlBarPrePhoto: some View {
        VStack {
            Spacer()
                .frame(height: controlButtonWidth)
            Spacer()
            capturePhotoButton
            Spacer()
            cancelButton
                .frame(height: controlButtonWidth, alignment: .center)
        }
    }
    
    var verticalControlBarPostPhoto: some View {
        VStack {
            usePhotoButton
                .frame(height: controlButtonWidth)
            Spacer()
            retakePhotoButton
                .frame(height: controlButtonWidth, alignment: .center)
        }
    }
    
}
