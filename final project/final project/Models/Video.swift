//
//  Video.swift
//  final project
//
//  Created by Jack Huo on 4/21/24.
//

import Foundation

class VideoModel : Equatable{
    static func == (lhs: VideoModel, rhs: VideoModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    var thumbnailURL: String
    let videoURL: String
    let uploader: UserProfile
    
    init(thumbnailURL: String, videoURL: String, uploader: UserProfile) {
        self.thumbnailURL = thumbnailURL
        self.videoURL = videoURL
        self.uploader = uploader
    }
}
