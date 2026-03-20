import Foundation

final class ActionsViewModel: ObservableObject {
    enum Filter: String, CaseIterable, Identifiable {
        case today = "Hoje"
        case upcoming = "Próximas"
        case risk = "Em risco"
        var id: String { rawValue }
    }

    @Published var selectedFilter: Filter = .today
    @Published private(set) var allActions: [ActionItem]
    private let opportunities: [Opportunity]

    init(repository: DashboardRepository = MockDashboardRepository(), prioritizationService: PrioritizationService = PrioritizationService()) {
        let opportunities = repository.opportunities()
        self.opportunities = opportunities
        self.allActions = prioritizationService.prioritizedActions(actions: repository.actions(), opportunities: opportunities)
    }

    var filteredActions: [ActionItem] {
        switch selectedFilter {
        case .today:
            return allActions.filter { ($0.dueDate.map { Calendar.current.isDateInToday($0) } ?? false) || $0.urgency == .critical }
        case .upcoming:
            return allActions.filter { ($0.dueDate ?? .distantPast) > .now }
        case .risk:
            let riskyNames = Set(opportunities.filter { Calendar.current.dateComponents([.day], from: $0.lastTouchDate, to: .now).day ?? 0 >= 5 }.map(\.name))
            return allActions.filter { riskyNames.contains($0.relatedName) }
        }
    }

    func complete(_ action: ActionItem) {
        update(action, status: .completed)
    }

    func snooze(_ action: ActionItem) {
        update(action, status: .snoozed)
    }

    private func update(_ action: ActionItem, status: ActionStatus) {
        guard let index = allActions.firstIndex(where: { $0.id == action.id }) else { return }
        let current = allActions[index]
        allActions[index] = ActionItem(id: current.id, title: current.title, relatedName: current.relatedName, value: current.value, urgency: current.urgency, dueDate: current.dueDate, recommendedStep: current.recommendedStep, status: status, type: current.type)
    }

    static let preview = ActionsViewModel()
}
