//
//  nursery.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import SwiftUI

struct nursery: View {
    var body: some View {
        VStack{
            Text("Nursery")
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
                Image("crib")
            }
            Text("Crib")
                .fontWidth(.standard)
                .font(.title)
                .bold()
                .padding(.top, 0.0)
                .fontDesign(.serif)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.blue)
            Button {
                print("Button Works")
            } label: {
                Image("toy shelf")
            }
            Text("Toy Shelf")
                .fontWidth(.standard)
                .font(.title)
                .bold()
                .padding(.top, 0.0)
                .fontDesign(.serif)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.yellow)
            
            NavigationLink(destination: dining_chair()) { // Navigate to AR view (ContentView)
                               Image("nurserychair")
                           }
            
            
            Text("Chair")
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
    nursery()
}
