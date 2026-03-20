import Foundation

final class OnboardingViewModel: ObservableObject {
    @Published var accessCode = ""
    @Published var isAuthenticated = false

    func enter() {
        isAuthenticated = true
    }
}
