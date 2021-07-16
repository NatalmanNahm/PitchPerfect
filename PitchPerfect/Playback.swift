//
//  playback.swift
//  PitchPerfect
//
//  Created by Natalman Nahm on 7/12/21.
//

import SwiftUI
import AVFoundation

struct playback: View {
    
    var audioLink: URL?
    var body: some View {
        
        VStack{
            HStack{
                VStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        CustomBtn(icon: "slow")
                    })
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 100))
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        CustomBtn(icon: "highPitch")
                    })
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 100))
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        CustomBtn(icon: "echo")
                    })
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 100))
                }
                
                VStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        CustomBtn(icon: "fast")
                    })
                    .padding(.bottom, 100.0)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        CustomBtn(icon: "lowPitch")
                    })
                    .padding(.bottom, 100.0)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        CustomBtn(icon: "reverb")
                    })
                    .padding(.bottom, 100.0)
                }
            }
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                CustomBtn(icon: "stop", wid: 72, hei: 72)
            })
        }
        
    }
}

struct playback_Previews: PreviewProvider {
    static var previews: some View {
        playback(audioLink: URL(string: "HHH")!)
    }
}
