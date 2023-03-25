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

class videoManager: ObservableObject {
    @Published private(set) var videos: [Video] = []
    @Published var selectedQuery: Query = Query.nature
    
    init() {
        Task.init {
            await findVideos(topic: selectedQuery)
        }
    }
    
    func findVideos(topic: Query) async {
        do {
            guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(topic)&per_page=10&orientation=potrait") else { fatalError("URL missing")}
            
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue("YOUR_API_KEY", forHTTPHeaderField: "Authorization")
            
            let ( data, response ) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("fetching data error") }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(ResponseBoby.self, from: data)
            
            self.videos = []
            self.videos = decodedData.videos
            
        } catch {
            print("Error fetching data from pixels api: \(error)")
        }
    }
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
