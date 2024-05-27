import Foundation

@Observable
class User {
    var name: String
    var accounts: [BankAccount]
    
    var sendNotifications: Bool = false
    
    init(name: String, accounts: [BankAccount]) {
        self.name = name
        self.accounts = accounts
    }
}

// MARK: demo
extension User {
    static func demo() -> User {
        User(name: "Giuseppe", accounts: BankAccount.demo())
    }
}
