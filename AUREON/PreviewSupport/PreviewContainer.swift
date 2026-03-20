import SwiftUI

struct PreviewContainer<Content: View>: View {
    let content: () -> Content

    var body: some View {
        content()
            .preferredColorScheme(.dark)
            .background(AureonColors.background)
    }
}
