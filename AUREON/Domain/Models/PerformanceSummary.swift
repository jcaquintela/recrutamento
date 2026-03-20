import Foundation

struct PerformanceSummary: Hashable {
    let executionScore: Int
    let completedActions: Int
    let missedCriticalActions: Int
    let weeklyTrendPoints: [Double]
    let pipelineDelta: Double
}
