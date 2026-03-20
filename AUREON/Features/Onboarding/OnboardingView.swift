import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: AureonSpacing.xl) {
            Spacer()
            Text("AUREON")
                .font(AureonTypography.hero)
                .foregroundStyle(AureonColors.textPrimary)
            Text("Execução acima do ruído.")
                .font(AureonTypography.section)
                .foregroundStyle(AureonColors.textSecondary)
            Text("Acesso reservado a consultores que operam com clareza, velocidade e discrição.")
                .font(AureonTypography.body)
                .foregroundStyle(AureonColors.textSecondary)

            AureonCard {
                VStack(alignment: .leading, spacing: AureonSpacing.md) {
                    Text("Código de acesso")
                        .font(AureonTypography.caption)
                        .foregroundStyle(AureonColors.textSecondary)
                    SecureField("Introduzir código", text: $viewModel.accessCode)
                        .textFieldStyle(.plain)
                        .font(AureonTypography.bodyStrong)
                        .foregroundStyle(AureonColors.textPrimary)
                    AureonButton(title: "Entrar") {
                        viewModel.enter()
                    }
                }
            }
            Text("Entrada exclusiva para membros aprovados.")
                .font(AureonTypography.caption)
                .foregroundStyle(AureonColors.textSecondary)
            Spacer()
        }
        .padding(AureonSpacing.xl)
        .background(AureonColors.background.ignoresSafeArea())
    }
}
