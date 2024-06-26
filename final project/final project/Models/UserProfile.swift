//
//  UserProfile.swift
//  final project
//
//  Created by Jack Huo on 4/21/24.
//

import Foundation

class UserProfile: Equatable {
    static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    var tag: String
    var name: String
    var description: String
    var videos: [VideoModel]
    var subscriptions: [UserProfile]
    var subscribers: [UserProfile]
    
    init(tag: String, name: String, description: String) {
        self.tag = tag
        self.name = name
        self.description = description
        self.videos = []
        self.subscriptions = []
        self.subscribers = []
    }
    
    func subscribe(otherUser: UserProfile) {
        if !self.subscriptions.contains(otherUser) {
            self.subscriptions.append(otherUser)
            otherUser.subscribers.append(self)
        }
    }
    
    func unsubscribe(otherUser: UserProfile) {
        if self.subscriptions.contains(otherUser) {
            guard let this_index = self.subscriptions.firstIndex(of: otherUser) else {
                return
            }
            guard let other_index = otherUser.subscriptions.firstIndex(of: self) else {
                return
            }
            self.subscriptions.remove(at: this_index)
            otherUser.subscriptions.remove(at: other_index)
        }
    }
    
    func postVideo(video: VideoModel) {
        self.videos.append(video)
    }
    
    func deleteVideo(video: VideoModel) {
        guard let this_index = self.videos.firstIndex(of: video) else {
            return
        }
        self.videos.remove(at: this_index)
    }
    
}
