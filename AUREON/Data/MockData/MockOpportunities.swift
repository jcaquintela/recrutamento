import Foundation

enum MockOpportunities {
    static let items: [Opportunity] = [
        Opportunity(id: UUID(), name: "Foz Prime 12", type: "Investidor", estimatedValue: 750_000, stage: .hot, nextAction: "Ligar hoje", lastTouchDate: .now.addingTimeInterval(-6 * 86_400), confidenceScore: 82, notes: "Cliente quer decisão rápida antes de viajar.", locationLabel: "Porto"),
        Opportunity(id: UUID(), name: "Casa Azul Gaia", type: "Vendedor", estimatedValue: 520_000, stage: .proposal, nextAction: "Enviar proposta final", lastTouchDate: .now.addingTimeInterval(-2 * 86_400), confidenceScore: 76, notes: "Concorrência discreta de outra agência.", locationLabel: "Vila Nova de Gaia"),
        Opportunity(id: UUID(), name: "Porto Office Asset", type: "Investidor", estimatedValue: 1_200_000, stage: .inProgress, nextAction: "Reunião de alinhamento", lastTouchDate: .now.addingTimeInterval(-1 * 86_400), confidenceScore: 64, notes: "Bom encaixe para cliente internacional.", locationLabel: "Porto Centro"),
        Opportunity(id: UUID(), name: "Residência Boavista", type: "Comprador", estimatedValue: 320_000, stage: .new, nextAction: "Agendar visita", lastTouchDate: .now.addingTimeInterval(-4 * 86_400), confidenceScore: 58, notes: "Procura resposta até ao fim da semana.", locationLabel: "Boavista"),
        Opportunity(id: UUID(), name: "Cedofeita Loft", type: "Comprador", estimatedValue: 190_000, stage: .inProgress, nextAction: "Atualizar documentação", lastTouchDate: .now.addingTimeInterval(-8 * 86_400), confidenceScore: 45, notes: "Interesse bom, mas ritmo lento.", locationLabel: "Cedofeita")
    ]
}
