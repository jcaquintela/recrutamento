import Foundation

struct InsightItem: Identifiable, Hashable {
    let id: UUID
    let title: String
    let explanation: String
    let recommendedAction: String
    let emphasis: InsightEmphasis
}

enum InsightEmphasis: Hashable {
    case neutral
    case positive
    case warning
}
