import SwiftUI

struct AureonButton: View {
    let title: String
    var systemImage: String? = nil
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: AureonSpacing.sm) {
                if let systemImage {
                    Image(systemName: systemImage)
                }
                Text(title)
            }
            .font(AureonTypography.bodyStrong)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(AureonColors.accent)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
    }
}
