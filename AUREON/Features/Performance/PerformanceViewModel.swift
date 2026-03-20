import Foundation

final class PerformanceViewModel: ObservableObject {
    @Published var summary: PerformanceSummary

    init(repository: DashboardRepository = MockDashboardRepository()) {
        self.summary = repository.performance()
    }

    static let preview = PerformanceViewModel()
}
