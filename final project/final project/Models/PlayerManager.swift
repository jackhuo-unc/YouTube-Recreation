//
//  PlayerManager.swift
//  final project
//
//  Created by Jack Huo on 4/25/24.
//

import Foundation
import AVKit

class PlayerManager : ObservableObject {
    let player: AVPlayer
    @Published private var playing = false
    
    func play() {
        player.play()
        playing = true
    }
    
    func playPause() {
        if playing {
            player.pause()
        } else {
            player.play()
        }
        playing.toggle()
    }
    
    init(player: AVPlayer, playing: Bool = false) {
        self.player = player
        self.playing = playing
    }
}
