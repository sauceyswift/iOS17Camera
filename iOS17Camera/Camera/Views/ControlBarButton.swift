//
//  CameraControlButton.swift
//  Garden Sun Mapper
//
//  Created by Michael Ceryak on 12/10/23.
//

import SwiftUI

struct ControlBarButton: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
                .tint(.white)
                .font(.title3)
                .fontWeight(.semibold)
        }
    }
}
