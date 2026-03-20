import SwiftUI

struct QuickAddView: View {
    @ObservedObject var viewModel: QuickAddViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AureonSpacing.lg) {
                AureonSectionHeader(title: "Quick Add", subtitle: "Captura imediata, sem atrito")
                AureonCard {
                    VStack(alignment: .leading, spacing: AureonSpacing.md) {
                        Label("Entrada por voz simulada", systemImage: "mic.fill")
                            .font(AureonTypography.caption)
                            .foregroundStyle(AureonColors.accent)
                        TextEditor(text: $viewModel.inputText)
                            .frame(height: 120)
                            .scrollContentBackground(.hidden)
                            .foregroundStyle(AureonColors.textPrimary)
                        AureonButton(title: "Analisar", systemImage: "wand.and.stars") {
                            viewModel.parseInput()
                        }
                    }
                }
                if let draft = viewModel.draft {
                    ParsedOpportunityConfirmationView(draft: draft) {
                        viewModel.saveDraft()
                    }
                }
                if let saved = viewModel.savedOpportunity {
                    Text("Guardado: \(saved.name)")
                        .font(AureonTypography.bodyStrong)
                        .foregroundStyle(AureonColors.accent)
                }
            }
            .padding(AureonSpacing.lg)
        }
        .background(AureonColors.background.ignoresSafeArea())
        .navigationTitle("Nova oportunidade")
    }
}
