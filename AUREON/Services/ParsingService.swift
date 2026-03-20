import Foundation

struct ParsingService {
    func parse(_ input: String) -> ParsedOpportunityDraft {
        let lowercased = input.lowercased()
        let value = extractValue(from: lowercased) ?? 250_000
        let location = extractLocation(from: lowercased)
        let nextStep = extractNextStep(from: input)
        let type = lowercased.contains("investidor") ? "Investidor" : lowercased.contains("vendedor") ? "Vendedor" : "Comprador"
        let name = inferName(from: input, type: type)

        return ParsedOpportunityDraft(
            rawInput: input,
            contactLabel: name,
            estimatedValue: value,
            locationLabel: location,
            nextStep: nextStep,
            type: type
        )
    }

    private func extractValue(from text: String) -> Double? {
        if text.contains("500 mil") { return 500_000 }
        if text.contains("750 mil") { return 750_000 }
        if text.contains("1,2") || text.contains("1.2") { return 1_200_000 }
        return nil
    }

    private func extractLocation(from text: String) -> String {
        ["porto", "gaia", "lisboa", "cascais", "matosinhos"].first(where: text.contains)?.capitalized ?? "Portugal"
    }

    private func extractNextStep(from text: String) -> String {
        if text.lowercased().contains("sexta") { return "Confirmar reunião de sexta" }
        if text.lowercased().contains("amanhã") { return "Fazer follow-up amanhã" }
        return "Validar próximo passo" 
    }

    private func inferName(from text: String, type: String) -> String {
        let parts = text.split(separator: ",").map { String($0).trimmingCharacters(in: .whitespaces) }
        return parts.first(where: { !$0.lowercased().contains(type.lowercased()) }) ?? "Nova oportunidade"
    }
}
