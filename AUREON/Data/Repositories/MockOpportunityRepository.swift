import Foundation

protocol OpportunityRepository {
    func all() -> [Opportunity]
    func save(draft: ParsedOpportunityDraft) -> Opportunity
}

final class MockOpportunityRepository: OpportunityRepository {
    private var items: [Opportunity] = MockOpportunities.items

    func all() -> [Opportunity] {
        items
    }

    func save(draft: ParsedOpportunityDraft) -> Opportunity {
        let opportunity = Opportunity(
            id: UUID(),
            name: draft.contactLabel,
            type: draft.type,
            estimatedValue: draft.estimatedValue,
            stage: .new,
            nextAction: draft.nextStep,
            lastTouchDate: .now,
            confidenceScore: 55,
            notes: "Criado via captura rápida.",
            locationLabel: draft.locationLabel
        )
        items.insert(opportunity, at: 0)
        return opportunity
    }
}
