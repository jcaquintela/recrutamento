import Foundation

struct MeetingItem: Identifiable, Hashable {
    let id: UUID
    let title: String
    let relatedOpportunity: String
    let scheduledAt: Date
    let location: String
    let hasNextStep: Bool
}
