
import SwiftUI

enum CameraControlBarStyle {
    case vertical
    case horizontal
}

public struct CameraView: View {
    @Environment(\.verticalSizeClass) private var vertiSizeClass
    
    @Binding var isPresented: Bool
    @Binding var imageData: Data?
    
    @State internal var VM = CameraViewModel()
    
    internal let controlButtonWidth: CGFloat = 120
    internal let controlFrameHeight: CGFloat = 90
    
    public init(isPresented: Binding<Bool>, imageData: Binding<Data?>) {
        self._isPresented = isPresented
        self._imageData = imageData
    }
    
    var isLandscape: Bool { vertiSizeClass == .compact }
    
    public var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            cameraAndControlView
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    var cameraAndControlView: some View {
        // this structure is necessary b/c we don't want to redraw the camera preview
        VStack {
            HStack {
                FramedCameraPreview(VM: VM)
//                Color.yellow.ignoresSafeArea() // for preview only
                if isLandscape {
                    controlBar(style: .vertical)
                        .ignoresSafeArea()
                }
            }
            if !isLandscape {
                controlBar(style: .horizontal)
                    .padding(.bottom)
            }
        }
    }
    
    @ViewBuilder func controlBar(style: CameraControlBarStyle) -> some View {
        switch style {
            case .horizontal: horizontalControlBar
            case .vertical: verticalControlBar
        }
    }

}


#Preview {
    CameraView(isPresented: .constant(true), imageData: .constant(nil))
}
