import SwiftUI

struct ScoreRing: View {
    let score: Int

    var body: some View {
        ZStack {
            Circle()
                .stroke(AureonColors.surfaceSecondary, lineWidth: 10)
            Circle()
                .trim(from: 0, to: CGFloat(score) / 100)
                .stroke(AureonColors.accent, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(.degrees(-90))
            VStack(spacing: 4) {
                Text("\(score)")
                    .font(AureonTypography.metric)
                Text("Execução")
                    .font(AureonTypography.caption)
                    .foregroundStyle(AureonColors.textSecondary)
            }
        }
        .frame(width: 110, height: 110)
    }
}
