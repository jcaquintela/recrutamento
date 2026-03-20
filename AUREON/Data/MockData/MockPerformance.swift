import Foundation

enum MockPerformance {
    static let summary = PerformanceSummary(
        executionScore: 86,
        completedActions: 18,
        missedCriticalActions: 2,
        weeklyTrendPoints: [58, 62, 71, 69, 76, 84, 86],
        pipelineDelta: 145_000
    )
}
