import Foundation

protocol DashboardRepository {
    func profile() -> UserProfile
    func actions() -> [ActionItem]
    func opportunities() -> [Opportunity]
    func meetings() -> [MeetingItem]
    func performance() -> PerformanceSummary
}

struct MockDashboardRepository: DashboardRepository {
    func profile() -> UserProfile {
        UserProfile(id: UUID(), firstName: "Marta", market: "Porto", roleLabel: "Consultora Principal")
    }

    func actions() -> [ActionItem] { MockActions.items }
    func opportunities() -> [Opportunity] { MockOpportunities.items }
    func meetings() -> [MeetingItem] { MockMeetings.items }
    func performance() -> PerformanceSummary { MockPerformance.summary }
}
