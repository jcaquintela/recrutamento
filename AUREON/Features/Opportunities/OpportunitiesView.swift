import SwiftUI

struct OpportunitiesView: View {
    @ObservedObject var viewModel: OpportunitiesViewModel

    var body: some View {
        List(viewModel.opportunities) { opportunity in
            NavigationLink {
                OpportunityDetailView(opportunity: opportunity)
            } label: {
                VStack(alignment: .leading, spacing: 8) {
                    Text(opportunity.name)
                        .font(AureonTypography.bodyStrong)
                    Text(opportunity.locationLabel)
                        .font(AureonTypography.caption)
                        .foregroundStyle(AureonColors.textSecondary)
                    HStack {
                        Text(opportunity.stage.rawValue)
                        Spacer()
                        Text(CurrencyFormattingService().string(from: opportunity.estimatedValue))
                    }
                    .font(AureonTypography.caption)
                    .foregroundStyle(AureonColors.accent)
                }
                .padding(.vertical, 8)
                .listRowBackground(AureonColors.background)
            }
        }
        .scrollContentBackground(.hidden)
        .background(AureonColors.background.ignoresSafeArea())
        .navigationTitle("Oportunidades")
    }
}
