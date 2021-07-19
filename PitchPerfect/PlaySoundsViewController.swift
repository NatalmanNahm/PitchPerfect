//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Natalman Nahm on 7/16/21.
//

import Foundation
import AVFoundation

var audioEngine: AVAudioEngine!
var audioFile: AVAudioFile!
var audioPlayerNode: AVAudioPlayerNode!
var stopTimer: Timer!

// MARK: PlayingState (raw values correspond to sender tags)
    
    enum PlayingState { case playing, notPlaying }

// MARK: Audio Functions
func setupAudio(audio: URL) {
       // initialize (recording) audio file
       do {
           audioFile = try AVAudioFile(forReading: audio as URL)
       } catch {
           print("There is no audio to play")
       }
   }

func playSound(audio: URL, rate: Float? = nil, pitch: Float? = nil, echo: Bool = false, reverb: Bool = false) {
        
    
        //Setup Audio
        setupAudio(audio: audio)
    
        // initialize audio engine components
        audioEngine = AVAudioEngine()
        
        // node for playing audio
        audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attach(audioPlayerNode)
        
        // node for adjusting rate/pitch
        let changeRatePitchNode = AVAudioUnitTimePitch()
        if let pitch = pitch {
            changeRatePitchNode.pitch = pitch
        }
        if let rate = rate {
            changeRatePitchNode.rate = rate
        }
        audioEngine.attach(changeRatePitchNode)
        
        // node for echo
        let echoNode = AVAudioUnitDistortion()
        echoNode.loadFactoryPreset(.multiEcho1)
        audioEngine.attach(echoNode)
        
        // node for reverb
        let reverbNode = AVAudioUnitReverb()
        reverbNode.loadFactoryPreset(.cathedral)
        reverbNode.wetDryMix = 50
        audioEngine.attach(reverbNode)
        
        // connect nodes
        if echo == true && reverb == true {
            connectAudioNodes(audioPlayerNode, changeRatePitchNode, echoNode, reverbNode, audioEngine.outputNode)
        } else if echo == true {
            connectAudioNodes(audioPlayerNode, changeRatePitchNode, echoNode, audioEngine.outputNode)
        } else if reverb == true {
            connectAudioNodes(audioPlayerNode, changeRatePitchNode, reverbNode, audioEngine.outputNode)
        } else {
            connectAudioNodes(audioPlayerNode, changeRatePitchNode, audioEngine.outputNode)
        }
        
        // schedule to play and start the engine!
        audioPlayerNode.stop()
//        audioPlayerNode.scheduleFile(audioFile, at: nil) {
//            
//        var delayInSeconds: Double = 0
//
//        if let lastRenderTime = audioPlayerNode.lastRenderTime, let playerTime = audioPlayerNode.playerTime(forNodeTime: lastRenderTime) {
//
//            if let rate = rate {
//                delayInSeconds = Double(audioFile.length - playerTime.sampleTime) / Double(audioFile.processingFormat.sampleRate) / Double(rate)
//            } else {
//                delayInSeconds = Double(audioFile.length - playerTime.sampleTime) / Double(audioFile.processingFormat.sampleRate)
//            }
//        }
//            
//            // schedule a stop timer for when audio finishes playing
//            stopTimer = Timer(timeInterval: delayInSeconds, target: self, selector: #selector(stopAudio), userInfo: nil, repeats: false)
//            RunLoop.main.add(stopTimer!, forMode: RunLoop.Mode.default)
//        }
        
        do {
            try audioEngine.start()
        } catch {
            print("An Error has occured")
            return
        }
        
        // play the recording!
        audioPlayerNode.play()
    }

// MARK: Connect List of Audio Nodes
   
func connectAudioNodes(_ nodes: AVAudioNode...) {
   for x in 0..<nodes.count-1 {
       audioEngine.connect(nodes[x], to: nodes[x+1], format: audioFile.processingFormat)
   }
}


func stopAudio() {

       if let audioPlayerNode = audioPlayerNode {
           audioPlayerNode.stop()
       }

       if let stopTimer = stopTimer {
           stopTimer.invalidate()
       }

//       configureUI(.notPlaying)

       if let audioEngine = audioEngine {
           audioEngine.stop()
           audioEngine.reset()
       }
   }

//func configureUI(_ playState: PlayingState) {
//        switch(playState) {
//        case .playing:
//            setPlayButtonsEnabled(false)
//            stopButton.isEnabled = true
//        case .notPlaying:
//            setPlayButtonsEnabled(true)
//            stopButton.isEnabled = false
//        }
//    }

//func showAlert(_ title: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: Alerts.DismissAlert, style: .default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
