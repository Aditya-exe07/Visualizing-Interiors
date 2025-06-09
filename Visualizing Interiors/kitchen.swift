//
//  kitchen.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import SwiftUI

struct kitchen: View {
    var body: some View {
        VStack{
            Text("Kitchen")
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
                Image("kitchen cabinets")
            }
            Text("Cabinets")
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
                Image("shelves")
            }
            Text("Shelves")
                .fontWidth(.standard)
                .font(.title)
                .bold()
                .padding(.top, 0.0)
                .fontDesign(.serif)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.purple)
            
            NavigationLink(destination: kitchenstoolview()) { // Navigate to AR view (ContentView)
                               Image("stools")
                           }
            
            Text("Tall Chairs")
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
    kitchen()
}
