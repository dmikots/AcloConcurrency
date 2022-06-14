import SwiftUI

public struct LoaderView: View {

    @Binding private var isActive: Bool

    init(isActive: Binding<Bool>) {
        _isActive = isActive
    }

    public var body: some View {
        if isActive {
            ZStack {
                Color.gray
                    .blur(radius: 0.2)
                    .edgesIgnoringSafeArea(.all)

                ProgressView()
            }
        }
    }
}
