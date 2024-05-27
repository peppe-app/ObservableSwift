import Foundation

enum TransactionType: Hashable {
    case income
    case expense
}

struct Transaction: Hashable, Identifiable {
    let id = UUID()
    
    var name: String
    var date: Date
    var amount: Decimal
    var merchant: String
    var type: TransactionType
}
