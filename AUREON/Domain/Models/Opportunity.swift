import Foundation

struct Opportunity: Identifiable, Hashable {
    let id: UUID
    let name: String
    let type: String
    let estimatedValue: Double
    let stage: OpportunityStage
    let nextAction: String
    let lastTouchDate: Date
    let confidenceScore: Int
    let notes: String
    let locationLabel: String
}

enum OpportunityStage: String, CaseIterable, Hashable {
    case new = "Nova"
    case inProgress = "Em curso"
    case hot = "Quente"
    case proposal = "Proposta"
    case closing = "Fecho"
}
