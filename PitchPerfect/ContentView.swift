//
//  ContentView.swift
//  PitchPerfect
//
//  Created by Natalman Nahm on 7/12/21.
//

import SwiftUI
import AVFoundation
struct ContentView: View {
    
    @State var isDisableRec = false
    @State var isDisableStop = true
    @State var action: Int?
    @State var audioRecorder: AVAudioRecorder?
    
    
    var body: some View {
        NavigationView{
            VStack{
                Button(action: {
                    
                    isDisableRec = true
                    isDisableStop = false
                    
                    let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
                    let recordingName = "recordedVoice.wav"
                    let pathArray = [dirPath, recordingName]
                    let filePath = URL(string: pathArray.joined(separator: "/"))

                    let session = AVAudioSession.sharedInstance()
                    try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

                    try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
                    audioRecorder!.isMeteringEnabled = true
                    audioRecorder!.prepareToRecord()
                    audioRecorder!.record()
                    
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
                    destination: playback(audioLink: self.audioRecorder?.url), tag: 1, selection: $action) {
                    EmptyView()
                }
                Button(
                    action:{
                        self.action = 1;
                        isDisableRec = false
                        isDisableStop = true
                        audioRecorder!.stop()
                        let audioSession = AVAudioSession.sharedInstance()
                        try! audioSession.setActive(false)
                    },
                    label:{
                        CustomBtn(icon: "stop", wid: 75, hei: 75)
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
