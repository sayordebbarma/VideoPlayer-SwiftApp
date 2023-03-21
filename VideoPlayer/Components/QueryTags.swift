//
//  QueryTags.swift
//  VideoPlayer
//
//  Created by Sayor Debbarma on 22/03/23.
//

import SwiftUI

struct QueryTags: View {
    var query: Query
    var isSelected: Bool
    var body: some View {
        Text(query.rawValue)
            .font(.caption)
            .bold()
            .foregroundColor(isSelected ? .black : .white)
            .padding(10)
            .background(.thinMaterial)
            .cornerRadius(8)
    }
}

struct QueryTags_Previews: PreviewProvider {
    static var previews: some View {
        QueryTags(query: Query.anime, isSelected: true)
    }
}
