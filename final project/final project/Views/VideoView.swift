//
//  VideoView.swift
//  final project
//
//  Created by Jack Huo on 4/21/24.
//

import SwiftUI
import AVKit

struct VideoView: View {
    @State var video: Video
    @State private var descriptionOpen: Bool = false
    var body: some View {
        let player = AVPlayer(url: URL(string: video.sources[0])!)
        VStack {
            VideoPlayer(player: player)
                .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
                .onAppear() {
                    player.play()
                }
            ScrollView {
                Button {
                    descriptionOpen.toggle()
                } label: {
                    VStack{
                        HStack{
                            Text(video.title)
                                .font(.title)
                                .foregroundColor(.primary)
                            Spacer()
                        }
                        
                        HStack {
                            Text("1,337 views  3 days ago")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                            Text("...more")
                                .foregroundColor(.secondary)
                                .font(.subheadline)
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal)
                VStack{
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
                        Text("\(video.author.rawValue)  ")
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
                    ScrollView(.horizontal) {
                        HStack{
                            HStack {
                                Button {
                                    //likes
                                } label: {
                                    HStack {
                                        Image(systemName: "hand.thumbsup")
                                        Text("420")
                                    }
                                }
                                Text("|")
                                Button {
                                    //dislikes
                                } label: {
                                    Image(systemName: "hand.thumbsdown")
                                }
                            }
                            .foregroundColor(.primary)
                            .padding(.all, 5)
                            .background(
                                Capsule()
                                    .fill(.secondary)
                            )
                            Button {
                                //shares
                            } label: {
                                HStack {
                                    Image(systemName: "arrowshape.turn.up.right")
                                    Text("Share")
                                }
                            }
                            .foregroundColor(.primary)
                            .padding(.all, 5)
                            .background(
                                Capsule()
                                    .fill(.secondary)
                            )
                            Button {
                                //remixes
                            } label: {
                                HStack {
                                    Image(systemName: "light.ribbon")
                                    Text("Remix")
                                }
                            }
                            .foregroundColor(.primary)
                            .padding(.all, 5)
                            .background(
                                Capsule()
                                    .fill(.secondary)
                            )
                            Button {
                                //downloads
                            } label: {
                                HStack {
                                    Image(systemName: "arrow.down.to.line")
                                    Text("Download")
                                }
                            }
                            .foregroundColor(.primary)
                            .padding(.all, 5)
                            .background(
                                Capsule()
                                    .fill(.secondary)
                            )
                            Button {
                                //clips
                            } label: {
                                HStack {
                                    Image(systemName: "scissors")
                                    Text("Clip")
                                }
                            }
                            .foregroundColor(.primary)
                            .padding(.all, 5)
                            .background(
                                Capsule()
                                    .fill(.secondary)
                            )
                            Button {
                                //saves
                            } label: {
                                HStack {
                                    Image(systemName: "bookmark")
                                    Text("save")
                                }
                            }
                            .foregroundColor(.primary)
                            .padding(.all, 5)
                            .background(
                                Capsule()
                                    .fill(.secondary)
                            )
                        }
                    }
                    VStack {
                        HStack {
                            Text("Comments")
                                .font(.title3)
                            Spacer()
                        }
                        HStack {
                            AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQD8pQHtqTnZvR-xXe7ZRkMTvIHCfU-8JWViwkCCnZeA&s")) {
                                image in image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(.circle)
                                    .frame(width: 30)
                            } placeholder: {
                                Image(systemName: "")
                            }
                            ZStack {
                                Capsule()
                                    .fill(.secondary)
                                    .foregroundColor(.blue)
                                Button {
                                    //begins comment draft
                                } label: {
                                    HStack {
                                        Text("Add a comment")
                                            .padding(.horizontal)
                                            .foregroundColor(.primary)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .sheet(isPresented: $descriptionOpen) {
                    DescriptionView(video: video)
                        .presentationDetents([.fraction(0.70)])
                }
            }
        }
    }
}

#Preview {
    VideoView(video: .example)
}
