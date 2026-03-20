import SwiftUI

struct ParsedOpportunityConfirmationView: View {
    let draft: ParsedOpportunityDraft
    let onConfirm: () -> Void

    var body: some View {
        AureonCard {
            VStack(alignment: .leading, spacing: AureonSpacing.sm) {
                AureonSectionHeader(title: "Confirmar captura")
                Text(draft.contactLabel)
                    .font(AureonTypography.bodyStrong)
                Text(draft.type)
                    .font(AureonTypography.caption)
                    .foregroundStyle(AureonColors.textSecondary)
                Text(CurrencyFormattingService().string(from: draft.estimatedValue))
                    .font(AureonTypography.bodyStrong)
                Text(draft.locationLabel)
                    .font(AureonTypography.body)
                Text(draft.nextStep)
                    .font(AureonTypography.body)
                    .foregroundStyle(AureonColors.textSecondary)
                AureonButton(title: "Confirmar") {
                    onConfirm()
                }
            }
        }
    }
}
