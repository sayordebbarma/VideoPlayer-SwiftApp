//
//  videoManager.swift
//  VideoPlayer
//
//  Created by Sayor Debbarma on 22/03/23.
//

import Foundation

enum Query: String, CaseIterable {
case nature, people, animal, food, ocean, anime
}

struct ResponseBoby: Decodable {
    var page: Int
    var perPage: Int
    var totalResults: Int
    var url: String
    var videos: [Video]
}

struct Video: Identifiable, Decodable {
    var id: Int
    var image: String
    var duration: Int
    var user: User
    var videoFiles: [VideoFile]
    
    struct User: Identifiable, Decodable {
        var id: Int
        var url: String
        var name: String
    }
    
    struct VideoFile: Identifiable, Decodable {
        var id: Int
        var quality: String
        var fileType: String
        var link: String
    }
}
