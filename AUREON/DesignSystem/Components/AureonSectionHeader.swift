import SwiftUI

struct AureonSectionHeader: View {
    let title: String
    var subtitle: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(AureonTypography.section)
                .foregroundStyle(AureonColors.textPrimary)
            if let subtitle {
                Text(subtitle)
                    .font(AureonTypography.caption)
                    .foregroundStyle(AureonColors.textSecondary)
            }
        }
    }
}
