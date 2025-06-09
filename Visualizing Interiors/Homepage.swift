//
//  Homepage.swift
//  Visualizing Interiors
//
//  Created by Aditya
//

import SwiftUI

struct Homepage: View {
    var body: some View {
        NavigationView{
            VStack(spacing :20){
                Text("Select a Room")
                    .fontWidth(.standard)
                    .font(.title)
                    .bold()
                    .padding(.top, -20)
                    .fontDesign(.serif)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                
                NavigationLink(destination: bedroom()){ // Navigate to BedroomView
                                    Image("bedroom")
                                }
                .padding(.trailing, -250.0)
                .padding(.top, -10.0)
                
                
                NavigationLink(destination: livingroom()) { // Navigate to LivingRoomView
                                    Image("living room")
                                }
                .padding(.leading, -180.0)
                .padding(.top, -160.0)
                
                NavigationLink(destination: dining()) { // Navigate to DiningView
                                   Image("dining")
                               }
                    .padding(.trailing, -200.0)
                    .padding(.top, -40.0)
                
                
                NavigationLink(destination: kitchen()) { // Navigate to KitchenView
                                    Image("kitchen")
                                }
                .padding(.leading, -180.0)
                .padding(.top, -160.0)
                
                NavigationLink(destination: studyroom()) { // Navigate to StudyRoomView
                                    Image("study room")
                                }
                .padding(.trailing, -180.0)
                .padding(.top, -40.0)
                
                NavigationLink(destination: bathroom()) { // Navigate to BathroomView
                                    Image("bathroom")
                                }
                .padding(.leading, -180.0)
                .padding(.top, -160.0)
                
                NavigationLink(destination: closet()) { // Navigate to ClosetView
                                    Image("closet")
                                }
                .padding(.trailing, -180.0)
                .padding(.top, -40.0)
                
                NavigationLink(destination: nursery()) { // Navigate to NurseryView
                                    Image("nursery")
                                }
                    .padding(.leading, -180.0)
                    .padding(.top, -160.0)
            }
        }
    }
}

#Preview {
    Homepage()
}
