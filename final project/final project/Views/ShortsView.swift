//
//  ShortsView.swift
//  final project
//
//  Created by Jack Huo on 4/18/24.
//

import SwiftUI
import AVKit

struct ShortsView: View {
    @StateObject var videoService = VideoService()
    @State private var currentIndex: Int? = 0
    @State private var currentPage = 0
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical) {
                LazyVStack(spacing: 0) {
                    ForEach(videoService.videos.indices, id: \.self) { index in
                        let player = AVPlayer(url: URL(string: videoService.videos[index].sources[0])!)
                        ZStack {
                            Rectangle()
                                .fill(Color.blue.opacity(0.6))
                                .containerRelativeFrame([.horizontal, .vertical])
                            FeedCell(video: videoService.videos[index], currentIndex: $currentIndex, index: index, player: player)
                            VStack{
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                HStack{
                                    Spacer()
                                    VStack {
                                        Image(systemName: "hand.thumbsup.fill")
                                        Text("1k")
                                            .font(.callout)
                                            .padding(.bottom)
                                        Image(systemName: "hand.thumbsdown.fill")
                                        Text("dislike")
                                            .font(.callout)
                                            .padding(.bottom)
                                        Image(systemName: "text.bubble.fill")
                                        Text("422")
                                            .font(.callout)
                                            .padding(.bottom)
                                        Image(systemName: "arrowshape.turn.up.right.fill")
                                        Text("share")
                                            .font(.callout)
                                            .padding(.bottom)
                                    }
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                }
                                .padding(.trailing)
                                HStack {
                                    AsyncImage(url: URL(string: "https://yt3.googleusercontent.com/aV7UujeJUQRd-S_JgbfoJSouMdsrM4y9W5Ok3A63ECMwYTVkn1-88G1aRR_cYhj799wMAHpW8g=s900-c-k-c0x00ffffff-no-rj")) {
                                        image in image
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(.circle)
                                            .frame(width: 30)
                                    } placeholder: {
                                        Image(systemName: "")
                                    }
                                    Text("\(videoService.videos[index].author.rawValue)  ")
                                    Text("42")
                                        .foregroundColor(.secondary)
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        Text("Subscribe")
                                            .foregroundColor(.primary)
                                            .padding(.all, 10)
                                            .background(
                                                Capsule()
                                                    .fill(.secondary)
                                            )
                                    }
                                }
                                .foregroundColor(.white)
                                .bold()
                                .padding()
                                Spacer()
                            }
                        }
                        .onAppear {
                            if index == videoService.videos.count - 1 {
                                currentPage = index // Track the current page
                            }
                        }
                        //.gesture(swipeGesture(index: index))
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.paging)
            .ignoresSafeArea()
            .onChange(of: currentIndex) { newIndex in
                // Scroll to the view corresponding to the new currentIndex
                proxy.scrollTo(newIndex, anchor: .top)
            }
            .onChange(of: currentPage) { newPage in
                // Update currentIndex when the user scrolls to a new page
                currentIndex = newPage
            }
        }
    }
    /*
    private func swipeGesture(index: Int) -> some Gesture {
            return DragGesture()
                .onEnded { gesture in
                    if gesture.translation.height < 0 {
                        currentIndex = index + 1 // Swipe left, move to next video
                    } else if gesture.translation.height > 0 {
                        currentIndex = index - 1 // Swipe right, move to previous video
                    }
                }
        }
     */
}

#Preview {
    ShortsView()
}
