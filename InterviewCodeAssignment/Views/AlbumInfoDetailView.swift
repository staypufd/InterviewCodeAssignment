//
//  AlbumDetailView.swift
//  InterviewCodeAssignment
//
//  Created by Sam Griffith on 9/18/23.
//

import SwiftUI

struct AlbumInfoDetailView: View {
    var albumInfo: AlbumInfo

    var body: some View {
        ScrollView {
            VStack {
                Text(albumInfo.title).font(.largeTitle).padding()
                Text(String(albumInfo.id)).padding()
                Text(String(albumInfo.albumId)).padding()
                AsyncImage(url: URL(string: albumInfo.thumbnailUrl))
                AsyncImage(url: URL(string: albumInfo.url))
            }
            .navigationBarTitle(Text(albumInfo.title), displayMode: .inline)
        }
    }
}

// MARK: Previews
struct AlbumInfoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumInfoDetailView(albumInfo: AlbumInfoViewModel().albumInfos.first ?? AlbumInfo.defaultAlbumInfo())
    }
    
}
