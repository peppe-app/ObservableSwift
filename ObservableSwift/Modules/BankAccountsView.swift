import SwiftUI

struct BankAccountsView: View {
        
    let accounts: [BankAccount]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(accounts) { account in
                    NavigationLink(value: account) {
                        HStack {
                            Text(account.name)
                            Spacer()
                            Text(account.balance, format: .currency(code: "AUD"))
                        }
                    }
                }
            }
            .navigationTitle("Accounts")
            .navigationDestination(for: BankAccount.self) { account in
                BankAccountView(account: account)
            }
        }
    }
}

#Preview {
    BankAccountsView(accounts: BankAccount.demo())
}
