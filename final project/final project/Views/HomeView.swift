//
//  HomeView.swift
//  final project
//
//  Created by Jack Huo on 4/18/24.
//

import SwiftUI
import AVKit

struct HomeView: View {
    @State var videoService = VideoService()
    var example_video = Video.example
    var body: some View {
        NavigationStack{
            ScrollView {
                ForEach(videoService.videos) { video in
                    VStack {
                        NavigationLink {
                            VideoView(video: video)
                        } label: {
                            AsyncImage(url: URL(string: video.thumb)) {
                                image in image
                                    .resizable()
                                    .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
                            } placeholder: {
                                Text("None")
                            }
                        }
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
                            VStack{
                                HStack{
                                    Text(video.title)
                                        .frame(alignment: .leading)
                                    Spacer()
                                }
                                HStack{
                                    Text("\(video.author.rawValue) ∙ 1k views ∙ 5months ago")
                                        .foregroundColor(.primary)
                                        .font(.caption)
                                        .frame(alignment: .leading)
                                    Spacer()
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
