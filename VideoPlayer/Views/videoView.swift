//
//  videoView.swift
//  VideoPlayer
//
//  Created by Sayor Debbarma on 24/03/23.
//

import SwiftUI
import AVKit

struct videoView: View {
    var video: Video
    @State private var player = AVPlayer()
    var body: some View {
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onAppear {
                if let link =
                    video.videoFiles.first?.link {
                    player = AVPlayer(url: URL(string: link)!)
                    player.play()
                }
            }
    }
    
}

struct videoView_Previews: PreviewProvider {
    static var previews: some View {
        videoView(video: previewVideo)
    }
}
