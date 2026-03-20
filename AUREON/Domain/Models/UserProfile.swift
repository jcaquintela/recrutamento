import Foundation

struct UserProfile: Identifiable, Hashable {
    let id: UUID
    let firstName: String
    let market: String
    let roleLabel: String
}
