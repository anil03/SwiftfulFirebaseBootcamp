//
//  RootView.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Anil Gupta on 23/08/24.
//

import SwiftUI

struct RootView: View {
    
    //create variable
    @State private var showSignInView: Bool = false
    
    var body: some View {
        
        ZStack {
            NavigationStack{
                SettingsView(showSignInView: $showSignInView)
            }
        }
        .onAppear{
            let authUser = try? AuthenticationManager.shared.getCurrentAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            
            NavigationStack{
                AuthenticationView()
            }
        })
    }
    
    
}

#Preview {
    RootView()
}
