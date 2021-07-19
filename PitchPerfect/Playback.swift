//
//  playback.swift
//  PitchPerfect
//
//  Created by Natalman Nahm on 7/12/21.
//

import SwiftUI
import AVFoundation

struct playback: View {
    
    var audioLink: URL? = nil
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    
    var body: some View {
        
        VStack{
            HStack{
                VStack{
                    Button(action: {playSound(audio: audioLink!, rate: 0.5)}, label: {
                        CustomBtn(icon: "slow")
                    })
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 100))
                    
                    Button(action: {playSound(audio: audioLink!, pitch: 1000 )}, label: {
                        CustomBtn(icon: "highPitch")
                    })
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 100))
                    
                    Button(action: {playSound(audio: audioLink!, echo: true)}, label: {
                        CustomBtn(icon: "echo")
                    })
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 100))
                }
                
                VStack{
                    Button(action: {playSound(audio: audioLink!, rate: 1.5)}, label: {
                        CustomBtn(icon: "fast")
                    })
                    .padding(.bottom, 100.0)
                    
                    Button(action: {playSound(audio: audioLink!, pitch: -1000)}, label: {
                        CustomBtn(icon: "lowPitch")
                    })
                    .padding(.bottom, 100.0)
                    
                    Button(action: {playSound(audio: audioLink!, reverb: true)}, label: {
                        CustomBtn(icon: "reverb")
                    })
                    .padding(.bottom, 100.0)
                }
            }
            
            Button(action: {stopAudio()}, label: {
                CustomBtn(icon: "stop", wid: 72, hei: 72)
            })
        }
        
    }
}

struct playback_Previews: PreviewProvider {
    static var previews: some View {
        playback(audioLink: nil)
    }
}
