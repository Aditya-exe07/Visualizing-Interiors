//
//  livingroom.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import SwiftUI

struct livingroom: View {
    var body: some View {
        VStack{
            Text("Living Room")
                .fontWidth(.standard)
                .font(.title)
                .bold()
                .padding(.top, 0.0)
                .fontDesign(.serif)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
            
            NavigationLink(destination: sofaview()) { // Navigate to AR view (ContentView)
                Image("sofa")
            }
            
            Text("Sofas")
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
                Image("cabinet")
            }
            Text("Cabinets")
                .fontWidth(.standard)
                .font(.title)
                .bold()
                .padding(.top, 0.0)
                .fontDesign(.serif)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.yellow)
            
            NavigationLink(destination: glasstableview()) { // Navigate to AR view (ContentView)
                Image("table")
            }
            
            
            Text("Tables")
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
    livingroom()
}
