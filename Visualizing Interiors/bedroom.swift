//
//  bedroom.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import SwiftUI

struct bedroom: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Bedroom")
                    .fontWidth(.standard)
                    .font(.title)
                    .bold()
                    .padding(.top, 0.0)
                    .fontDesign(.serif)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                
                NavigationLink(destination: Bedview()) { // Navigate to AR view (ContentView)
                                   Image("bed")
                               }
                
                Text("Bed")
                    .fontWidth(.standard)
                    .font(.title)
                    .bold()
                    .padding(.top, 0.0)
                    .fontDesign(.serif)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.blue)
                
                NavigationLink(destination: BackendView2()) { // Navigate to AR view (ContentView)
                                   Image("chair")
                               }
                Text("Chair")
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
                    Image("bedside table")
                }
                Text("Bedside Table")
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
}

#Preview {
    bedroom()
}
