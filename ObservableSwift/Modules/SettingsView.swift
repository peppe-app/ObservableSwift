import SwiftUI

struct SettingsView: View {
    
    @Bindable var user: User
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Name", text: $user.name)
                    Toggle(isOn: $user.sendNotifications, label: {
                        Text("Receive notifications")
                    })
                } header: {
                    Text("Details")
                }
            }
            .navigationTitle("Settings")
        }
    }
    
}

#Preview {
    SettingsView(user: .demo())
}
