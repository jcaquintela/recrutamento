import SwiftUI

struct CommandCenterView: View {
    @ObservedObject var viewModel: CommandCenterViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AureonSpacing.lg) {
                header
                criticalActionsSection
                pipelineSection
                meetingsSection
                insightSection
                executionScoreSection
            }
            .padding(AureonSpacing.lg)
        }
        .background(AureonColors.background.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(viewModel.greeting)
                .font(AureonTypography.title)
                .foregroundStyle(AureonColors.textPrimary)
            Text(viewModel.todayLabel)
                .font(AureonTypography.caption)
                .foregroundStyle(AureonColors.textSecondary)
        }
    }

    private var criticalActionsSection: some View {
        VStack(alignment: .leading, spacing: AureonSpacing.md) {
            AureonSectionHeader(title: "3 ações críticas hoje", subtitle: "Clareza imediata para proteger momentum")
            ForEach(viewModel.criticalActions) { action in
                NavigationLink {
                    Text(action.title)
                } label: {
                    AureonCard {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(action.title)
                                .font(AureonTypography.bodyStrong)
                                .foregroundStyle(AureonColors.textPrimary)
                            Text(action.relatedName)
                                .font(AureonTypography.caption)
                                .foregroundStyle(AureonColors.textSecondary)
                            Text(action.recommendedStep)
                                .font(AureonTypography.body)
                                .foregroundStyle(AureonColors.textPrimary)
                        }
                    }
                }
            }
        }
    }

    private var pipelineSection: some View {
        AureonCard {
            VStack(alignment: .leading, spacing: 10) {
                AureonSectionHeader(title: "Pipeline", subtitle: "Onde está o dinheiro")
                Text(viewModel.pipelineValueLabel)
                    .font(AureonTypography.metric)
                    .foregroundStyle(AureonColors.textPrimary)
                Text("Oportunidade com maior impacto: Porto Office Asset")
                    .font(AureonTypography.caption)
                    .foregroundStyle(AureonColors.textSecondary)
            }
        }
    }

    private var meetingsSection: some View {
        VStack(alignment: .leading, spacing: AureonSpacing.md) {
            AureonSectionHeader(title: "Próximas reuniões")
            ForEach(viewModel.meetings) { meeting in
                AureonCard {
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(meeting.title)
                                .font(AureonTypography.bodyStrong)
                            Text(meeting.relatedOpportunity)
                                .font(AureonTypography.caption)
                                .foregroundStyle(AureonColors.textSecondary)
                        }
                        Spacer()
                        Text(DateFormattingService().time(meeting.scheduledAt))
                            .font(AureonTypography.bodyStrong)
                    }
                    .foregroundStyle(AureonColors.textPrimary)
                }
            }
        }
    }

    private var insightSection: some View {
        AureonCard {
            VStack(alignment: .leading, spacing: 8) {
                AureonSectionHeader(title: "Insight")
                if let insight = viewModel.insights.first {
                    Text(insight.title)
                        .font(AureonTypography.bodyStrong)
                        .foregroundStyle(AureonColors.textPrimary)
                    Text(insight.explanation)
                        .font(AureonTypography.body)
                        .foregroundStyle(AureonColors.textSecondary)
                    Text(insight.recommendedAction)
                        .font(AureonTypography.caption)
                        .foregroundStyle(AureonColors.accent)
                }
            }
        }
    }

    private var executionScoreSection: some View {
        AureonCard {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    AureonSectionHeader(title: "Execução da semana")
                    Text("Tens ritmo forte. Protege o topo do pipeline.")
                        .font(AureonTypography.body)
                        .foregroundStyle(AureonColors.textSecondary)
                }
                Spacer()
                ScoreRing(score: viewModel.performance.executionScore)
            }
        }
    }
}
