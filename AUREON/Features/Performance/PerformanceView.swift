import SwiftUI

struct PerformanceView: View {
    @ObservedObject var viewModel: PerformanceViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AureonSpacing.lg) {
                AureonSectionHeader(title: "Performance", subtitle: "Autogestão sem ruído")
                AureonCard {
                    HStack {
                        ScoreRing(score: viewModel.summary.executionScore)
                        VStack(alignment: .leading, spacing: 8) {
                            Text("\(viewModel.summary.completedActions) ações concluídas")
                            Text("\(viewModel.summary.missedCriticalActions) críticas ignoradas")
                                .foregroundStyle(AureonColors.textSecondary)
                            Text("Pipeline +\(CurrencyFormattingService().string(from: viewModel.summary.pipelineDelta))")
                                .foregroundStyle(AureonColors.accent)
                        }
                        .font(AureonTypography.body)
                    }
                }
                AureonCard {
                    AureonSectionHeader(title: "Tendência semanal")
                    HStack(alignment: .bottom, spacing: 8) {
                        ForEach(Array(viewModel.summary.weeklyTrendPoints.enumerated()), id: \.offset) { _, point in
                            RoundedRectangle(cornerRadius: 6)
                                .fill(AureonColors.accent.opacity(0.8))
                                .frame(height: point)
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 110, alignment: .bottom)
                }
            }
            .padding(AureonSpacing.lg)
        }
        .background(AureonColors.background.ignoresSafeArea())
    }
}
