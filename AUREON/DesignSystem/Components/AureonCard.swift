import SwiftUI

struct AureonCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(AureonSpacing.lg)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(AureonColors.surface)
            .overlay(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(AureonColors.border, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}
