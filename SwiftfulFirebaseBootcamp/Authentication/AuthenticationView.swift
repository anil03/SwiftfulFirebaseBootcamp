//
//  AuthenticationView.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Anil Gupta on 22/08/24.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        
        VStack{
            NavigationLink {
                SignInView()
            } label: {
                Text("Sign In with Email")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(
                        Color.blue
                    )
                    .cornerRadius(10.0)

            }

        }
        .padding(.horizontal, 20)
        .navigationTitle("Sing In")
    }
}

#Preview {
    NavigationStack {
        AuthenticationView()
    }
}
