//
//  bathroom.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import SwiftUI

struct bathroom: View {
    var body: some View {
        VStack{
            Text("Bathroom")
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
                Image("bath cabinet")
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
            
            NavigationLink(destination: kitchenstoolview()) { // Navigate to AR view (ContentView)
                               Image("bath stool")
                           }
            
            
            Text("Stools")
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
                Image("bath shelves")
            }
            Text("Shelves")
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
    bathroom()
}
