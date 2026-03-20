import Foundation

struct ParsedOpportunityDraft: Hashable {
    let rawInput: String
    var contactLabel: String
    var estimatedValue: Double
    var locationLabel: String
    var nextStep: String
    var type: String
}
