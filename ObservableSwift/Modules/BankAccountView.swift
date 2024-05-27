import SwiftUI

struct BankAccountView: View {
    
    let account: BankAccount
    @State private var newTransaction: Bool = false
    
    var body: some View {
        List {
            Section {
                Text(account.balance, format: .currency(code: "AUD"))
                    .font(.title2)
                    .fontWeight(.medium)
            } header: {
                Text("Balance")
            }
            
            ForEach(account.transactions.sorted(by: { $0.date > $1.date })) { transaction in
                TransactionView(transaction: transaction)
            }
        }
        .navigationTitle(account.name)
        .toolbar {
            Button("Add") {
                newTransaction.toggle()
            }
        }
        .sheet(isPresented: $newTransaction, content: {
            EditTransactionView(account: account)
        })
    }
}

struct TransactionView: View {
    
    let transaction: Transaction
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(transaction.name)
                Spacer()
                Text(transaction.amount, format: .currency(code: "AUD"))
            }
            Text(transaction.date, format: .dateTime.day(.defaultDigits).month())
                .font(.footnote)
        }
    }
}

struct EditTransactionView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let account: BankAccount
    
    @State var transaction = Transaction(
        name: "",
        date: .now,
        amount: 0,
        merchant: "",
        type: .expense
    )
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $transaction.name)
                TextField("Amount", value: $transaction.amount, format: .number)
                DatePicker("Date", selection: $transaction.date)
            }
            .toolbar {
                Button("Save") {
                    account.add(transaction)
                    dismiss()
                }
                .disabled(transaction.name.isEmpty)
            }
            .navigationTitle("Transaction")
        }
    }
    
}

#Preview {
    NavigationStack {
        BankAccountView(account: .demo()[0])
    }
}
