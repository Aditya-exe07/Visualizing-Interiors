//
//  Logo.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import SwiftUI

struct LogoView: View {
    // State to control navigation after delay
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            // After the delay, navigate to the next view
            LogIn() // Replace with your next view
        } else {
            // Show the splash screen (logo page)
            VStack {
                Image("logo")
                .padding([.top, .leading, .trailing], -100.0)
                .padding(.trailing, -100)
                .frame(alignment: .center)
                .foregroundColor(.primary)
            
            Text("Visualizing Interiors")
                           .fontWidth(.standard)
                           .font(.title)
                           .padding([.leading, .bottom, .trailing], -22.0)
                           .bold()
                           .fontDesign(.serif)
                           .font(.headline)
                           .multilineTextAlignment(.center)
                           .padding(.all, 0.0)
                           .foregroundColor(.primary)
            }
            .onAppear {
                // Delay for 5 seconds before moving to the next view
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}


