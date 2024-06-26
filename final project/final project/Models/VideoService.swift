//
//  VideoService.swift
//  final project
//
//  Created by Jack Huo on 4/21/24.
//

import Foundation

class VideoService: ObservableObject {
    
    var all_videos: VideoData
    
    /// Initializer that decodes the Pokedex JSON and stores it in the pokedex variable
    init() {
        
        // TODO: Write your code here.
        print("1")
        let url = Bundle.main.url(forResource: "video_data", withExtension: "json")!
        print("2")
        
        let data = try! Data(contentsOf: url)
        print("3")
        
        let decoder = JSONDecoder()
        print("4")
        
        self.all_videos = try! decoder.decode(VideoData.self, from: data)
        print("5")
    }
    
    /// Computed property that returns a list of the pokemon
    var videos: [Video] {
        all_videos.videos
    }
        
        /// Function that searches the list of Pokemon for a pokemon with the given id. Returns nil if not found.
        func getVideoById(id: Int) -> Video? {
            all_videos.videos.first(where: {$0.id == id})
      }
}
