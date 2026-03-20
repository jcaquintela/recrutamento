import SwiftUI

struct AureonChip: View {
    let title: String
    var isSelected = false

    var body: some View {
        Text(title)
            .font(AureonTypography.caption)
            .foregroundStyle(isSelected ? Color.black : AureonColors.textPrimary)
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(isSelected ? AureonColors.accent : AureonColors.surfaceSecondary)
            .clipShape(Capsule())
    }
}
