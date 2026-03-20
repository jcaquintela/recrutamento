import Foundation

struct InsightEngine {
    func generateInsights(opportunities: [Opportunity], actions: [ActionItem], meetings: [MeetingItem]) -> [InsightItem] {
        var insights: [InsightItem] = []

        let staleHighValue = opportunities.filter { $0.estimatedValue >= 300_000 && daysSince($0.lastTouchDate) >= 5 }
        if !staleHighValue.isEmpty {
            insights.append(
                InsightItem(
                    id: UUID(),
                    title: "Tens \(staleHighValue.count) negócios a perder velocidade",
                    explanation: "Há valor alto sem contacto recente.",
                    recommendedAction: "Reativa hoje \(staleHighValue.prefix(2).map(\.name).joined(separator: " e ")).",
                    emphasis: .warning
                )
            )
        }

        let meetingsWithoutNextStep = meetings.filter { Calendar.current.isDateInToday($0.scheduledAt) && !$0.hasNextStep }
        if let meeting = meetingsWithoutNextStep.first,
           let relatedOpportunity = opportunities.first(where: { $0.name == meeting.relatedOpportunity }) {
            insights.append(
                InsightItem(
                    id: UUID(),
                    title: "Uma reunião hoje pode desbloquear \(Formatters.euro.string(from: NSNumber(value: relatedOpportunity.estimatedValue)) ?? "€0")",
                    explanation: "A reunião de hoje ainda não tem passo seguinte definido.",
                    recommendedAction: "Sai da reunião com próximo compromisso marcado.",
                    emphasis: .positive
                )
            )
        }

        let lowValueActions = actions.filter { $0.value < 250_000 }.count
        if lowValueActions >= 3 {
            insights.append(
                InsightItem(
                    id: UUID(),
                    title: "Estás focado em demasiado baixo valor",
                    explanation: "Há demasiadas ações com impacto financeiro reduzido.",
                    recommendedAction: "Protege a manhã para os dois maiores negócios.",
                    emphasis: .neutral
                )
            )
        }

        return insights.isEmpty ? MockInsights.items : insights
    }

    private func daysSince(_ date: Date) -> Int {
        Calendar.current.dateComponents([.day], from: date, to: .now).day ?? 0
    }
}
