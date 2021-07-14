//
//  ContentView.swift
//  PitchPerfect
//
//  Created by Natalman Nahm on 7/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var isDisableRec = false
    @State var isDisableStop = true
    @State var action: Int?
    
    var body: some View {
        NavigationView{
            VStack{
                Button(action: {
                    isDisableRec = true
                    isDisableStop = false
                    print("I am disable")
                }) {
                    Image("record")
                        .padding()
                        .frame(width: 120, height: 120)
                        .background(Color.green)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.black)
                        .foregroundColor(.black)
                        .shadow(color: .green, radius: 5)
                }.disabled(isDisableRec)
                
                Text("Tap to record")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom)
                
                NavigationLink(
                    destination: playback(), tag: 1, selection: $action) {
                    EmptyView()
                }
                Button(action: {self.action = 1; isDisableRec = false
                        isDisableStop = true}, label: {
                    Image("stop")
                        .padding()
                        .frame(width: 65, height: 65)
                        .background(Color.green)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.black)
                        .foregroundColor(.black)
                        .shadow(color: .green, radius: 5)
                }).disabled(isDisableStop)
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
