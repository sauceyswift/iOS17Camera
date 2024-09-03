//
//  CameraView+HorizontalControlBar.swift
//  iOS17Camera
//
//  Created by Michael Ceryak on 1/31/24.
//

import SwiftUI

extension CameraView {
    
    @ViewBuilder var horizontalControlBar: some View {
        if VM.photoData != nil {
            horizontalControlBarPostPhoto
                .frame(height: controlFrameHeight, alignment: .center)
        } else {
            horizontalControlBarPrePhoto
                .frame(height: controlFrameHeight, alignment: .center)
        }
    }
    
    var horizontalControlBarPrePhoto: some View {
        HStack {
            cancelButton
                .frame(width: controlButtonWidth, alignment: .center)
            Spacer()
            capturePhotoButton
            Spacer()
            Spacer()
                .frame(width: controlButtonWidth)
        }
    }
    
    var horizontalControlBarPostPhoto: some View {
        HStack {
            retakePhotoButton
            Spacer()
            usePhotoButton
        }
        .padding(.horizontal)
        .padding(.horizontal)
    }
    
}
