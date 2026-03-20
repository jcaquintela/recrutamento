import Foundation

final class OpportunitiesViewModel: ObservableObject {
    @Published var opportunities: [Opportunity]

    init(repository: OpportunityRepository = MockOpportunityRepository()) {
        self.opportunities = repository.all()
    }

    static let preview = OpportunitiesViewModel()
}
