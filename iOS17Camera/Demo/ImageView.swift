//
//  ImageView.swift
//  iOS17Camera
//
//  Created by Michael Ceryak on 1/31/24.
//

import SwiftUI

struct ImageView: View {
    
    let imgData: Data?
    
    var body: some View {
        if let imgData, let uiImage = UIImage(data: imgData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
        } else {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    ImageView(imgData: nil)
        .padding()
}
