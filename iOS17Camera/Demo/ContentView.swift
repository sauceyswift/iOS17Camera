//
//  ContentView.swift
//  CameraTesting
//
//  Created by Michael Ceryak on 12/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var imageData: Data? = nil
    @State private var showCamera: Bool = false
    
    var body: some View {
        VStack {
            ImageView(imgData: imageData)
                .padding()
            Button("Take Photo") {
                showCamera = true
            }
        }
        .fullScreenCamera(isPresented: $showCamera, imageData: $imageData)
    }
    
}


#Preview {
    ContentView()
}
