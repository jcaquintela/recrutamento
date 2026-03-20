import Foundation

enum MockInsights {
    static let items: [InsightItem] = [
        InsightItem(id: UUID(), title: "Tens 2 negócios a perder velocidade", explanation: "Valor elevado sem contacto recente.", recommendedAction: "Reativa hoje os dois contactos principais.", emphasis: .warning),
        InsightItem(id: UUID(), title: "Uma reunião hoje pode desbloquear 320.000 €", explanation: "Há uma reunião sem próximo passo definido.", recommendedAction: "Sai da reunião com compromisso fechado.", emphasis: .positive)
    ]
}
