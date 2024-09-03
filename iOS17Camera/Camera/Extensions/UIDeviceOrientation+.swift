//
//  UIDeviceOrientation+.swift
//  Garden Sun Mapper
//
//  Created by Michael Ceryak on 12/10/23.
//

import Foundation
import UIKit

extension UIDeviceOrientation {
    var videoRotationAngle: CGFloat {
        switch self {
        case .portraitUpsideDown: return 270
        case .landscapeRight: return 180
        case .landscapeLeft: return 0
        case .portrait: return 90
        default: return 90
        }
    }
    var uiImageOrientation: UIImage.Orientation {
        switch self {
        case .portraitUpsideDown: return .left
        case .landscapeRight: return .down
        case .landscapeLeft: return .up
        case .portrait: return .right
        default: return .right
        }
    }
}
