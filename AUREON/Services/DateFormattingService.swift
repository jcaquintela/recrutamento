import Foundation

struct DateFormattingService {
    func longDate(_ date: Date) -> String {
        Formatters.ptDate.string(from: date)
    }

    func time(_ date: Date) -> String {
        Formatters.ptTime.string(from: date)
    }
}
