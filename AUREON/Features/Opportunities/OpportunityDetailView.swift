import SwiftUI

struct OpportunityDetailView: View {
    let opportunity: Opportunity

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AureonSpacing.lg) {
                AureonCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(opportunity.name)
                            .font(AureonTypography.title)
                        Text(opportunity.stage.rawValue)
                            .font(AureonTypography.caption)
                            .foregroundStyle(AureonColors.accent)
                        Text(CurrencyFormattingService().string(from: opportunity.estimatedValue))
                            .font(AureonTypography.metric)
                    }
                }
                AureonCard {
                    detailRow(title: "Último toque", value: DateFormattingService().longDate(opportunity.lastTouchDate))
                    detailRow(title: "Próxima ação", value: opportunity.nextAction)
                    detailRow(title: "Confiança", value: "\(opportunity.confidenceScore)%")
                    detailRow(title: "Movimento recomendado", value: "Liga hoje e fecha um compromisso objetivo.")
                }
                AureonCard {
                    Text(opportunity.notes)
                        .font(AureonTypography.body)
                        .foregroundStyle(AureonColors.textSecondary)
                }
            }
            .padding(AureonSpacing.lg)
        }
        .background(AureonColors.background.ignoresSafeArea())
    }

    private func detailRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(AureonTypography.caption)
                .foregroundStyle(AureonColors.textSecondary)
            Text(value)
                .font(AureonTypography.bodyStrong)
                .foregroundStyle(AureonColors.textPrimary)
        }
    }
}
