//
//  dining.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import SwiftUI

struct dining: View {
    var body: some View {
        VStack{
            Text("Dining")
                .fontWidth(.standard)
                .font(.title)
                .bold()
                .padding(.top, 0.0)
                .fontDesign(.serif)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
            
            Button {
                print("Button Works")
            } label: {
                Image("diningtable")
            }
            
            
            Text("Dining Table")
                .fontWidth(.standard)
                .font(.title)
                .bold()
                .padding(.top, 0.0)
                .fontDesign(.serif)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.blue)
            
            NavigationLink(destination: dining_chair()) { // Navigate to AR view (ContentView)
                               Image("chairsdining")
                           }
            
            
            Text("Chairs")
                .fontWidth(.standard)
                .font(.title)
                .bold()
                .padding(.top, 0.0)
                .fontDesign(.serif)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.yellow)
            
            
            NavigationLink(destination: diningtableview()) { // Navigate to AR view (ContentView)
                               Image("bench")
                           }
            
            Text("Bench")
                .fontWidth(.standard)
                .font(.title)
                .bold()
                .padding(.top, 0.0)
                .fontDesign(.serif)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.pink)



        }
    }
}

#Preview {
    dining()
}
