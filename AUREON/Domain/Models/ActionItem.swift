import Foundation

struct ActionItem: Identifiable, Hashable {
    let id: UUID
    let title: String
    let relatedName: String
    let value: Double
    let urgency: ActionUrgency
    let dueDate: Date?
    let recommendedStep: String
    let status: ActionStatus
    let type: ActionType
}

enum ActionUrgency: String, CaseIterable, Hashable {
    case critical = "Crítica"
    case high = "Alta"
    case medium = "Média"
}

enum ActionStatus: String, Hashable {
    case open
    case completed
    case snoozed
}

enum ActionType: String, Hashable {
    case meeting = "Reunião"
    case followUp = "Follow-up"
    case proposal = "Proposta"
    case call = "Chamada"
}
