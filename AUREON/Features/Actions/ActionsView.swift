import SwiftUI

struct ActionsView: View {
    @ObservedObject var viewModel: ActionsViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AureonSpacing.lg) {
                AureonSectionHeader(title: "Execução", subtitle: "Foco nas próximas decisões")
                filterBar
                LazyVStack(spacing: AureonSpacing.md) {
                    ForEach(viewModel.filteredActions) { action in
                        NavigationLink {
                            Text(action.title)
                        } label: {
                            AureonCard {
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Text(action.title)
                                            .font(AureonTypography.bodyStrong)
                                        Spacer()
                                        Text(ActionUrgencyLabel.text(for: action.urgency))
                                            .font(AureonTypography.caption)
                                            .foregroundStyle(AureonColors.accent)
                                    }
                                    Text(action.relatedName)
                                        .font(AureonTypography.caption)
                                        .foregroundStyle(AureonColors.textSecondary)
                                    Text(CurrencyFormattingService().string(from: action.value))
                                        .font(AureonTypography.bodyStrong)
                                    Text(action.recommendedStep)
                                        .font(AureonTypography.body)
                                        .foregroundStyle(AureonColors.textSecondary)
                                }
                            }
                        }
                        .swipeActions {
                            Button("Concluir") { viewModel.complete(action) }
                                .tint(.green)
                            Button("Adiar") { viewModel.snooze(action) }
                                .tint(.orange)
                        }
                    }
                }
            }
            .padding(AureonSpacing.lg)
        }
        .background(AureonColors.background.ignoresSafeArea())
    }

    private var filterBar: some View {
        HStack(spacing: AureonSpacing.sm) {
            ForEach(ActionsViewModel.Filter.allCases) { filter in
                Button {
                    viewModel.selectedFilter = filter
                } label: {
                    AureonChip(title: filter.rawValue, isSelected: viewModel.selectedFilter == filter)
                }
            }
        }
    }
}

enum ActionUrgencyLabel {
    static func text(for urgency: ActionUrgency) -> String { urgency.rawValue }
}
