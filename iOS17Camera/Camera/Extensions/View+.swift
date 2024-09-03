//
//  View+.swift
//  iOS17Camera
//
//  Created by Michael Ceryak on 1/31/24.
//

import SwiftUI

extension View {
    func fullScreenCamera(isPresented: Binding<Bool>, imageData: Binding<Data?>) -> some View {
        self
            .fullScreenCover(isPresented: isPresented) {
                CameraView(isPresented: isPresented, imageData: imageData)
            }
    }
}
