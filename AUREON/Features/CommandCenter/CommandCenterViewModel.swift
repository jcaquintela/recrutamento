import Foundation

final class CommandCenterViewModel: ObservableObject {
    @Published var user: UserProfile
    @Published var criticalActions: [ActionItem]
    @Published var opportunities: [Opportunity]
    @Published var meetings: [MeetingItem]
    @Published var insights: [InsightItem]
    @Published var performance: PerformanceSummary

    private let currencyService = CurrencyFormattingService()
    private let dateService = DateFormattingService()

    init(repository: DashboardRepository = MockDashboardRepository(), prioritizationService: PrioritizationService = PrioritizationService(), insightEngine: InsightEngine = InsightEngine()) {
        let user = repository.profile()
        let opportunities = repository.opportunities()
        let actions = prioritizationService.prioritizedActions(actions: repository.actions(), opportunities: opportunities)
        self.user = user
        self.criticalActions = Array(actions.prefix(3))
        self.opportunities = opportunities
        self.meetings = repository.meetings()
        self.performance = repository.performance()
        self.insights = insightEngine.generateInsights(opportunities: opportunities, actions: actions, meetings: repository.meetings())
    }

    var greeting: String {
        "Bom dia, \(user.firstName)"
    }

    var todayLabel: String {
        dateService.longDate(.now)
    }

    var pipelineValueLabel: String {
        currencyService.string(from: opportunities.reduce(0) { $0 + $1.estimatedValue })
    }

    static let preview = CommandCenterViewModel()
}
