import SwiftUI

struct TransactionsView: View {
    
    @Environment(User.self) var user
    
    private var data: [Transaction] {
        user.accounts.reduce(into: [], { $0 += $1.transactions })
            .sorted(by: { $0.date >= $1.date })
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .navigationTitle("Transactions")
        }
    }
}

#Preview {
    TransactionsView()
        .environment(User.demo())
}
