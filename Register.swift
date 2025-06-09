//
//  Register.swift
//  Visualizing Interiors
//
//  Created by Aditya
//


import SwiftUI
import CoreData

struct Register: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var mobileNo = ""
    @State private var emailId = ""
    @State private var setPassword = ""
    @State private var successMessage = ""
    @State private var showLogin = false  // To navigate to login after registration

    let context = PersistenceController.shared.context

    var body: some View {
        NavigationStack {
            VStack {
                Text("Your Journey To")
                    .fontWidth(.standard)
                    .font(.title)
                    .bold()
                    .padding(.top,10.0)
                    .fontDesign(.serif)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.primary)
                
                Text("A Perfect Home")
                    .fontWidth(.standard)
                    .font(.title)
                    .bold()
                    .fontDesign(.serif)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.primary)
                
                Text("Begins Here")
                    .fontWidth(.standard)
                    .font(.title)
                    .bold()
                    .fontDesign(.serif)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.primary)
                
              NavigationLink(destination: LogIn()) {
                    Text("Already Have an Account? Log In")
                        .padding(.top, 10)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, -100)
                }

                Image("Register")
                    .cornerRadius(15)
                    .padding(.bottom, 10)

                TextField("First Name", text: $firstName)
                    .fontDesign(.serif)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.10))
                    .cornerRadius(30)
                    .padding(.top,1)

                TextField("Last Name", text: $lastName)
                    .fontDesign(.serif)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.10))
                    .cornerRadius(30)
                    .padding(.top,1)
                
                TextField("Mobile No.", text: $mobileNo)
                    .fontDesign(.serif)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.10))
                    .cornerRadius(30)
                    .padding(.top,1)

                TextField("Username", text: $emailId)
                    .fontDesign(.serif)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.10))
                    .cornerRadius(30)
                    .padding(.top,1)

                SecureField("Set Password", text: $setPassword)
                    .fontDesign(.serif)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.10))
                    .cornerRadius(30)
                    .padding(.top,1)

                Button(action: {
                    registerUser()
                }) {
                    Image("create button")
                        .padding(.top, 10)
                }
                .padding(.top, 0)

                Text(successMessage)
                    .foregroundColor(.green)
                    .padding(.top, 10)
            }
            .padding()
            .navigationDestination(isPresented: $showLogin) {
                LogIn()
            }
        }
    }

    func registerUser() {
        guard !firstName.isEmpty, !lastName.isEmpty, !mobileNo.isEmpty, !emailId.isEmpty, !setPassword.isEmpty else {
            successMessage = "All fields are required!"
            return
        }

        let newUser = User(context: context)
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.mobileNo = mobileNo
        newUser.email = emailId.lowercased()
        newUser.password = setPassword

        do {
            try context.save()
            successMessage = "User Registered Successfully!"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showLogin = true  // Navigate to login screen after 1 sec
            }
        } catch {
            print("Failed to save user: \(error)")
            successMessage = "Registration failed. Try again!"
        }
    }
}

#Preview {
    Register()
}
