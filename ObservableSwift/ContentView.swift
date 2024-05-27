import SwiftUI

struct ContentView: View {
    
    @Environment(User.self) var user
    
    var body: some View {
        TabView {
            BankAccountsView(accounts: user.accounts)
                .tabItem { Text("Accounts") }
            
            TransactionsView()
                .tabItem { Text("Transactions") }
            
            SettingsView(user: user)
                .tabItem { Text("Settings") }
        }
    }
}

#Preview {
    ContentView()
        .environment(User.demo())
}
