//
//  VideoCard.swift
//  VideoPlayer
//
//  Created by Sayor Debbarma on 22/03/23.
//

import SwiftUI

struct VideoCard: View {
    var video: Video
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: video.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height: 260)
                    .cornerRadius(20)
                
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(width: 160, height: 260)
                    .cornerRadius(20)
            }
            HStack {
                Image(systemName: "play.fill")
                    .padding(8)
                    .background(.ultraThinMaterial)
                    .cornerRadius(50)
                
                VStack(alignment: .leading) {
                    Text("\(video.duration)")
                        .font(.caption).bold()
                    Text("by \(video.user.name)")
                        .font(.caption).bold()
                        .multilineTextAlignment(.leading) // to not center the text even if its too long
                }
            }
            .padding(8)
            .foregroundColor(.white)
        }
    }
}

struct VideoCard_Previews: PreviewProvider {
    static var previews: some View {
        VideoCard(video: previewVideo)
    }
}
