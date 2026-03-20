import Foundation

enum MockMeetings {
    static let items: [MeetingItem] = [
        MeetingItem(id: UUID(), title: "Reunião com investidor", relatedOpportunity: "Porto Office Asset", scheduledAt: .now.addingTimeInterval(10_800), location: "Avenida da Boavista", hasNextStep: false),
        MeetingItem(id: UUID(), title: "Visita privada", relatedOpportunity: "Foz Prime 12", scheduledAt: .now.addingTimeInterval(18_000), location: "Foz do Douro", hasNextStep: true)
    ]
}
