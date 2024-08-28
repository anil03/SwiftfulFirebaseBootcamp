//
//  SettingsView.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Anil Gupta on 23/08/24.
//

import SwiftUI


@MainActor
final class SettingViewModel: ObservableObject{
    
    func signOut() throws{
        try? AuthenticationManager.shared.signOut()
    }
}

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingViewModel()
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        List {
            Button("Log out") {
                //call log out
                Task{
                    do{
                        try viewModel.signOut()
                        showSignInView = true
                    }catch{
                        print("Log out error \(error)")
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack{
        SettingsView(showSignInView: .constant(false))
    }
}
