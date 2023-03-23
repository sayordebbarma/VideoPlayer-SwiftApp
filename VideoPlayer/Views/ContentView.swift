//
//  ContentView.swift
//  VideoPlayer
//
//  Created by Sayor Debbarma on 22/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(Query.allCases, id: \.self) { searchQuery in
                    QueryTags(query: searchQuery, isSelected: false)
                    
                }
            }
            ScrollView{
                VideoCard(video: previewVideo)
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color("AccentColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
