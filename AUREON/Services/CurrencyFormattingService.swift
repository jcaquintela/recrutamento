import Foundation

struct CurrencyFormattingService {
    func string(from value: Double) -> String {
        Formatters.euro.string(from: NSNumber(value: value)) ?? "€0"
    }
}
