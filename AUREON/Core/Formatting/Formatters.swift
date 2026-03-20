import Foundation

enum Formatters {
    static let euro: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        formatter.locale = Locale(identifier: "pt_PT")
        formatter.maximumFractionDigits = 0
        return formatter
    }()

    static let ptDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_PT")
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()

    static let ptTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_PT")
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
}
