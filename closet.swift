//
//  closet.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import SwiftUI

struct closet: View {
    var body: some View {
        VStack{
            Text("Closet")
                .fontWidth(.standard)
                .font(.title)
                .bold()
                .padding(.top, 0.0)
                .fontDesign(.serif)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
            
            NavigationLink(destination: wardrobeview()) { // Navigate to AR view (ContentView)
                               Image("wardrobe")
                           }
            
            
            Text("Wardrobe")
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
                Image("dresser")
            }
            Text("Dresser")
                .fontWidth(.standard)
                .font(.title)
                .bold()
                .padding(.top, 0.0)
                .fontDesign(.serif)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.yellow)
            Button {
                print("Button Works")
            } label: {
                Image("shoerack")
            }
            Text("Shoe Rack")
                .fontWidth(.standard)
                .font(.title)
                .bold()
                .padding(.top, 0.0)
                .fontDesign(.serif)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.purple)



        }
    }
}

#Preview {
    closet()
}
