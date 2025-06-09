//
//  studyroom.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import SwiftUI

struct studyroom: View {
    var body: some View {
        VStack{
            Text("Study Room")
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
                Image("Desk")
            }
            Text("Desk")
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
                Image("book shelf")
            }
            Text("Book Shelf")
                .fontWidth(.standard)
                .font(.title)
                .bold()
                .padding(.top, 0.0)
                .fontDesign(.serif)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.yellow)
            
            NavigationLink(destination: BackendView()) { // Navigate to AR view (ContentView)
                               Image("chairs")
                           }
            
            
            Text("Chairs")
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
    studyroom()
}
