//
//  ContentView.swift
//  PitchPerfect
//
//  Created by Natalman Nahm on 7/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            VStack{
                
                Button(action: {
                    print("Hello")
                }) {
                    Image("record")
                        .padding()
                        .frame(width: 120, height: 120)
                        .background(Color.green)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.black)
                        .foregroundColor(.black)
                        .shadow(color: .green, radius: 5)
                }
                
                Text("Tap to record")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                NavigationLink(
                    destination: playback(),
                    label: {
                        Image("stop")
                            .padding()
                            .frame(width: 65, height: 65)
                            .background(Color.green)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.black)
                            .foregroundColor(.black)
                            .shadow(color: .green, radius: 5)
                        
                    })
                
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
