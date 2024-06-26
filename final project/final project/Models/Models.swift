//
//  VideoModel.swift
//  final project
//
//  Created by Jack Huo on 4/21/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let videoData = try? JSONDecoder().decode(VideoData.self, from: jsonData)

import Foundation

// MARK: - VideoData
struct VideoData: Codable {
    let videos: [Video]
}

// MARK: - Video
struct Video: Codable, Identifiable {
    let id: Int
    let description: String
    let sources: [String]
    let author: Author
    let thumb: String
    let title: String
}

enum Author: String, Codable {
    case BlenderFoundation = "Blender Foundation"
    case Garage419 = "Garage419"
    case Google = "Google"
}

extension Video {
    static var example: Video {
        Video(id: 1, description: "Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself. When one sunny day three rodents rudely harass him, something snaps... and the rabbit ain't no bunny anymore! In the typical cartoon tradition he prepares the nasty rodents a comical revenge.\n\nLicensed under the Creative Commons Attribution license\nhttp://www.bigbuckbunny.org", sources: [
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        ], author: .BlenderFoundation, thumb: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg", title: "Big Buck Bunny")
    }
}

