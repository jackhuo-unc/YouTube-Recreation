//
//  DescriptionView.swift
//  final project
//
//  Created by Jack Huo on 4/22/24.
//

import SwiftUI

struct DescriptionView: View {
    @State var video: Video
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack{
                        Text("\(video.title)")
                            .font(.title)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        VStack{
                            Text("420")
                                .bold()
                            Text("likes")
                        }
                        Spacer()
                        VStack{
                            Text("1,337")
                                .bold()
                            Text("views")
                        }
                        Spacer()
                        VStack{
                            Text("Jan 1")
                                .bold()
                            Text("2024")
                        }
                        Spacer()
                    }
                    .padding(.vertical)
                    Text(video.description)
                    HStack{
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
                            Text(video.author.rawValue)
                                .bold()
                            Text("42 subscribers")
                                .font(.caption)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            .navigationTitle("Description")
        }
    }
}

#Preview {
    DescriptionView(video: .example)
}
