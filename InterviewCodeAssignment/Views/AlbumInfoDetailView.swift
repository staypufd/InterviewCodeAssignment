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
        ScrollView(.vertical) {
            ScrollView(.horizontal) {
                VStack(alignment:.leading) {
                    Text(albumInfo.title).font(.largeTitle).padding().lineLimit(4)
                    Text(String(albumInfo.id)).padding()
                    Text(String(albumInfo.albumId)).padding()
                    AsyncImage(url: URL(string: albumInfo.thumbnailUrl))
                    AsyncImage(url: URL(string: albumInfo.url)).scaledToFit()
                }
                //            .frame(maxWidth: .infinity)
                .navigationBarTitle(Text(albumInfo.title), displayMode: .inline)
                Spacer()
            }
        }
    }
}

// MARK: Previews
struct AlbumInfoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumInfoDetailView(albumInfo: AlbumInfoViewModel().albumInfos.first ?? AlbumInfo.defaultAlbumInfo())
    }
    
}
