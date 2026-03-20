import Foundation

final class IntelligenceViewModel: ObservableObject {
    @Published var insights: [InsightItem]

    init(repository: DashboardRepository = MockDashboardRepository(), insightEngine: InsightEngine = InsightEngine()) {
        let opportunities = repository.opportunities()
        let actions = repository.actions()
        let meetings = repository.meetings()
        self.insights = insightEngine.generateInsights(opportunities: opportunities, actions: actions, meetings: meetings)
    }

    static let preview = IntelligenceViewModel()
}
