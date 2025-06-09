//
//  LogIn.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import SwiftUI
import CoreData

struct LogIn: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongusername = 0
    @State private var wrongpassword = 0
    @State private var showloginscreen = false  // Controls navigation
    @State private var errorMessage = ""

    let context = PersistenceController.shared.context

    var body: some View {
        NavigationStack {
            VStack {
                Text("Visualizing Interiors")
                    .fontWidth(.standard)
                    .font(.title)
                    .bold()
                    .padding(.top, 15.0)
                    .fontDesign(.serif)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.primary)

                Image("login")
                    .padding(.top, 15.0)
                    .cornerRadius(30)
                    .padding(.bottom, 50)

                TextField("Username", text: $username)
                    .fontDesign(.serif)
                    .padding()
                    .frame(width:300,height:50)
                    .background(Color.white.opacity(0.10))
                    .cornerRadius(30)
                    .border(.red, width: CGFloat(wrongusername))

                SecureField("Password", text: $password)
                    .padding()
                    .frame(width:300,height:50)
                    .background(Color.white.opacity(0.10))
                    .cornerRadius(30)
                    .border(.red, width: CGFloat(wrongpassword))

                Button(action: {
                    authenticateUser()
                }) {
                    Image("login button")
                }
                .padding(.top, 50)

                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.top, 10)

                NavigationLink(destination: Register()) {
                    Text("Create an Account")
                        .foregroundColor(.blue)
                        .padding(.top, 10)
                }
            }
            .padding()
            .navigationDestination(isPresented: $showloginscreen) {
                Homepage()
            }
        }
    }

    func authenticateUser() {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", username.lowercased())

        do {
            let users = try context.fetch(fetchRequest)
            if let user = users.first {
                if user.password == password {
                    wrongusername = 0
                    wrongpassword = 0
                    showloginscreen = true  // Navigate to Homepage
                } else {
                    wrongpassword = 2
                    errorMessage = "Incorrect password!"
                }
            } else {
                wrongusername = 2
                errorMessage = "User not found!"
            }
        } catch {
            print("Error fetching user: \(error)")
            errorMessage = "Login failed. Try again!"
        }
    }
}

#Preview {
    LogIn()
}

