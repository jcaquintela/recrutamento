import SwiftUI

struct IntelligenceView: View {
    @ObservedObject var viewModel: IntelligenceViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AureonSpacing.lg) {
                AureonSectionHeader(title: "Inteligência", subtitle: "Sinais curtos. Decisões rápidas.")
                ForEach(viewModel.insights) { insight in
                    AureonCard {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(insight.title)
                                .font(AureonTypography.bodyStrong)
                            Text(insight.explanation)
                                .font(AureonTypography.body)
                                .foregroundStyle(AureonColors.textSecondary)
                            Text(insight.recommendedAction)
                                .font(AureonTypography.caption)
                                .foregroundStyle(AureonColors.accent)
                        }
                        .foregroundStyle(AureonColors.textPrimary)
                    }
                }
            }
            .padding(AureonSpacing.lg)
        }
        .background(AureonColors.background.ignoresSafeArea())
    }
}
