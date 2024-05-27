import SwiftUI

@main
struct ObservableSwiftApp: App {
    
    @State var user = User.demo()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(user)
        }
    }
}
