//
//  PopupModal.swift
//  final project
//
//  Created by Jack Huo on 4/22/24.
//

import SwiftUI
import WebKit

//copied from https://www.hackingwithswift.com/forums/swiftui/how-to-play-a-youtube-video-in-swiftui/16467

struct YouTubeView: UIViewRepresentable {
    let videoId: String
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoId)?playsinline=1") else { return }
        uiView.scrollView.isScrollEnabled = false
        let request = URLRequest(url: youtubeURL)
        uiView.load(request)
    }
}

struct PopupModal: View {
    @ObservedObject var ad_vm = AdViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            YouTubeView(videoId: ad_vm.adVideoURL ?? "Cv1RJTHf5fk?si=0NZN7arUbHVQzCwr")
                .scaledToFill()
                .padding()
            AdView(viewModel: ad_vm)
            Button("Close") {
                dismiss()
            }
            .padding()
        }
        .interactiveDismissDisabled()
    }
}

#Preview {
    PopupModal()
}
