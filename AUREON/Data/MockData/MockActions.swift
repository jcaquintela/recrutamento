import Foundation

enum MockActions {
    static let items: [ActionItem] = [
        ActionItem(id: UUID(), title: "Ligar ao investidor", relatedName: "Foz Prime 12", value: 750_000, urgency: .critical, dueDate: .now.addingTimeInterval(3600), recommendedStep: "Confirmar presença na visita privada", status: .open, type: .call),
        ActionItem(id: UUID(), title: "Enviar proposta ajustada", relatedName: "Casa Azul Gaia", value: 520_000, urgency: .critical, dueDate: .now.addingTimeInterval(7200), recommendedStep: "Fechar versão final com condições", status: .open, type: .proposal),
        ActionItem(id: UUID(), title: "Follow-up pós-reunião", relatedName: "Residência Boavista", value: 320_000, urgency: .high, dueDate: .now.addingTimeInterval(86_400), recommendedStep: "Agendar segunda visita", status: .open, type: .followUp),
        ActionItem(id: UUID(), title: "Preparar reunião", relatedName: "Porto Office Asset", value: 1_200_000, urgency: .high, dueDate: .now, recommendedStep: "Levar cenário de negociação", status: .open, type: .meeting),
        ActionItem(id: UUID(), title: "Atualizar documentação", relatedName: "Cedofeita Loft", value: 190_000, urgency: .medium, dueDate: .now.addingTimeInterval(172_800), recommendedStep: "Pedir certidão ao cliente", status: .open, type: .followUp)
    ]
}
