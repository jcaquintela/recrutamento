import SwiftUI

struct RootView: View {
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    @State private var selectedTab: RootTab = .today
    @State private var showingQuickAdd = false

    var body: some View {
        Group {
            if onboardingViewModel.isAuthenticated {
                mainShell
            } else {
                OnboardingView(viewModel: onboardingViewModel)
            }
        }
        .background(AureonColors.background.ignoresSafeArea())
    }

    private var mainShell: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                NavigationStack { CommandCenterView(viewModel: .preview) }
                    .tag(RootTab.today)
                    .tabItem { Label("Hoje", systemImage: "sparkles") }

                NavigationStack { ActionsView(viewModel: .preview) }
                    .tag(RootTab.actions)
                    .tabItem { Label("Ações", systemImage: "checklist") }

                NavigationStack { OpportunitiesView(viewModel: .preview) }
                    .tag(RootTab.opportunities)
                    .tabItem { Label("Oportunidades", systemImage: "briefcase") }

                NavigationStack { IntelligenceView(viewModel: .preview) }
                    .tag(RootTab.intelligence)
                    .tabItem { Label("Inteligência", systemImage: "brain.head.profile") }

                NavigationStack { PerformanceView(viewModel: .preview) }
                    .tag(RootTab.profile)
                    .tabItem { Label("Perfil", systemImage: "person.crop.circle") }
            }
            .tint(AureonColors.accent)

            Button(action: { showingQuickAdd = true }) {
                Image(systemName: "waveform.badge.plus")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(.black)
                    .frame(width: 64, height: 64)
                    .background(AureonColors.accent)
                    .clipShape(Circle())
                    .shadow(color: AureonColors.accent.opacity(0.25), radius: 16, y: 8)
            }
            .padding(.bottom, 34)
        }
        .sheet(isPresented: $showingQuickAdd) {
            NavigationStack {
                QuickAddView(viewModel: .preview)
            }
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
        }
    }
}

enum RootTab {
    case today
    case actions
    case opportunities
    case intelligence
    case profile
}
