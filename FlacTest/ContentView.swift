//
//  ContentView.swift
//  FlacTest
//
//  Created by SA.Snow on 2022/1/14.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        VStack (spacing: 30) {
            Button {
                playAudio(forResource: "梁静茹-勇气", ofType: "flac")
            } label: {
                Text("play flac")
            }
            Button {
                playAudio(forResource: "七里香", ofType: "mp3")
            } label: {
                Text("play mp3")
            }
        }
    }
    
    func playAudio(forResource: String, ofType: String) {
        let path = Bundle.main.path(forResource: forResource, ofType: ofType)!
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("音频文件出现问题")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
