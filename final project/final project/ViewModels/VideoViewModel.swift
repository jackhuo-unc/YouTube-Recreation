//
//  VideoViewModel.swift
//  final project
//
//  Created by Jack Huo on 4/21/24.
//

import Foundation

class VideoViewModel: ObservableObject {
    @Published var video: Video
    
    init(video: Video) {
        self.video = video
    }
    
    var sources: String {
        video.sources.joined(separator: ", ")
    }
    
    var title: String {
        video.title
    }
    
    var thumbnail: String {
        video.thumb
    }
    
    var author: String {
        video.author.rawValue
    }
    
    var description: String {
        video.description
    }
}
