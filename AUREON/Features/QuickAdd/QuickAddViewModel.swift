import Foundation

final class QuickAddViewModel: ObservableObject {
    @Published var inputText = "Investidor, 500 mil, Porto, reunião sexta"
    @Published var draft: ParsedOpportunityDraft?
    @Published var savedOpportunity: Opportunity?

    private let parsingService: ParsingService
    private let repository: MockOpportunityRepository

    init(parsingService: ParsingService = ParsingService(), repository: MockOpportunityRepository = MockOpportunityRepository()) {
        self.parsingService = parsingService
        self.repository = repository
    }

    func parseInput() {
        draft = parsingService.parse(inputText)
    }

    func saveDraft() {
        guard let draft else { return }
        savedOpportunity = repository.save(draft: draft)
    }

    static let preview = QuickAddViewModel()
}
