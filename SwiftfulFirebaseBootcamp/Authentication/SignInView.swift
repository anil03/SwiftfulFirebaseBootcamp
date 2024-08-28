//
//  SignInView.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Anil Gupta on 22/08/24.
//

import SwiftUI

final class SignInEmailViewModel: ObservableObject{
    
    //creeate variables
    @Published var email: String = ""
    @Published var password: String = ""
    
    
    //call create user here
    func signInUser(){
        
        //check email and passowrd
        
        guard !email.isEmpty, !password.isEmpty else {
            print("No email and paswword found.")
            return
        }

        Task{
            
            do{
                let authDataResult = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("sucess")
                print(authDataResult)
                
            }catch{
                print("Error: \(error)")
            }
            
        }
        
    }
    
    
    
    
}




struct SignInView: View {
    
    @StateObject var viewModel =  SignInEmailViewModel()
    
    var body: some View {
        VStack {
            TextField("Email..", text: $viewModel.email)
                .frame(height: 50)
                .padding(.horizontal, 10)
                .background(
                    Color.gray.opacity(0.4)
                )
                .cornerRadius(10)

            SecureField("Password..", text: $viewModel.password)
                .frame(height: 50)
                .padding(.horizontal, 10)
                .background(
                    Color.gray.opacity(0.4)
                )
                .cornerRadius(10)

            
            Button {
                
                viewModel.signInUser()

            } label: {
                Text("Sign In")
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
        .navigationTitle("Sign In")
    }
}

#Preview {
    
    NavigationStack{
        SignInView()
    }
    
    
}
