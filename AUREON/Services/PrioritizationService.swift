import Foundation

struct PrioritizationService {
    func prioritizedActions(actions: [ActionItem], opportunities: [Opportunity]) -> [ActionItem] {
        let opportunityMap = Dictionary(uniqueKeysWithValues: opportunities.map { ($0.name, $0) })

        return actions.sorted { lhs, rhs in
            score(for: lhs, opportunity: opportunityMap[lhs.relatedName]) > score(for: rhs, opportunity: opportunityMap[rhs.relatedName])
        }
    }

    private func score(for action: ActionItem, opportunity: Opportunity?) -> Double {
        let valueWeight = action.value / 50_000
        let urgencyWeight: Double = switch action.urgency {
        case .critical: 40
        case .high: 24
        case .medium: 12
        }
        let confidenceWeight = Double(opportunity?.confidenceScore ?? 50) * 0.35
        let inactivityPenalty = inactivityDays(for: opportunity) * 4
        return valueWeight + urgencyWeight + confidenceWeight - inactivityPenalty
    }

    private func inactivityDays(for opportunity: Opportunity?) -> Double {
        guard let opportunity else { return 0 }
        let seconds = Date().timeIntervalSince(opportunity.lastTouchDate)
        return max(0, seconds / 86_400)
    }
}
