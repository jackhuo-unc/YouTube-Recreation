//
//  FeedCell.swift
//  final project
//
//  Created by Jack Huo on 4/22/24.
//

import SwiftUI
import AVKit

struct FeedCell: View {
    let video: Video
    @Binding var currentIndex: Int?
    let index: Int
    let player: AVPlayer
        
    var body: some View {
        GeometryReader { geometry in
            VideoPlayer(player: player) {
                VStack {
                    Text(video.title)
                        .font(.headline)
                        .padding()
                    Spacer()
                }
            }
            .onAppear() {
                if let currentIndex = currentIndex, currentIndex == index {
                                    if player.timeControlStatus != .playing {
                                        player.play()
                                    }
                                } else {
                                    player.pause()
                                }
            }
            .onDisappear {
                player.pause()
            }
            .frame(width: .infinity, height: UIScreen.main.bounds.height)
            .aspectRatio(16/9, contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
        }
    }
}
/*
 #Preview {
 FeedCell(video: .example, currentIndex: $0, index: 0)
 }
 */
