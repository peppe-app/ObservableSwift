import Foundation
import Observation

@Observable
class BankAccount: Identifiable {
    let id = UUID()
    
    var name: String
    private(set) var transactions: [Transaction]
    
    var balance: Decimal {
        transactions.reduce(into: Decimal(0), { $0 += $1.amount })
    }
    
    init(name: String, transactions: [Transaction]) {
        self.name = name
        self.transactions = transactions
    }
    
    func add(_ transaction: Transaction) {
        transactions.append(transaction)
    }
}

extension BankAccount: Hashable {
    static func ==(lhs: BankAccount, rhs: BankAccount) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: Test
extension BankAccount {
    static func demo() -> [BankAccount] {
        [
            BankAccount(name: "UniBank", transactions: [
                Transaction(
                    name: "Uber eats",
                    date: Calendar.current.date(byAdding: .day, value: -1, to: .now)!,
                    amount: -55.99,
                    merchant: "Uber",
                    type: .expense
                ),
                Transaction(
                    name: "Spesa",
                    date: Calendar.current.date(byAdding: .day, value: -2, to: .now)!,
                    amount: -14.07,
                    merchant: "Coop",
                    type: .expense
                ),
                Transaction(
                    name: "Accredito Salario",
                    date: Calendar.current.date(byAdding: .day, value: -3, to: .now)!,
                    amount: 1_500,
                    merchant: "MyCompany",
                    type: .income
                )
            ]),
            BankAccount(name: "Credit Card", transactions: [
                Transaction(
                    name: "Restaurant",
                    date: .now,
                    amount: -75.50,
                    merchant: "Bistro",
                    type: .expense
                ),
                Transaction(
                    name: "Groceries",
                    date: Calendar.current.date(byAdding: .day, value: -2, to: .now)!,
                    amount: -120.30,
                    merchant: "Supermarket",
                    type: .expense
                ),
                Transaction(
                    name: "Online Shopping",
                    date: Calendar.current.date(byAdding: .day, value: -3, to: .now)!,
                    amount: -200.00,
                    merchant: "Amazon",
                    type: .expense
                )
            ])
        ]
    }
}
