//
//  AdView.swift
//  final project
//
//  Created by Jack Huo on 4/22/24.
//

import SwiftUI

//copied from ChatGPT
struct AdView: View {
    @ObservedObject var viewModel: AdViewModel
    
    var body: some View {
        VStack {
            if let image = viewModel.adImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(adTextOverlay)
            } else {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Failed to load ad image.")
                }
            }
        }
        .onAppear {
            viewModel.fetchRandomAdData()
        }
    }
    
    @ViewBuilder
    private var adTextOverlay: some View {
        if let text = viewModel.adText {
            Text(text)
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)
                .padding(10)
                .offset(x: 0, y: 0) // Adjust offset as needed
                .multilineTextAlignment(.center)
        } else {
            EmptyView()
        }
    }
}

#Preview {
    AdView(viewModel: AdViewModel())
}
