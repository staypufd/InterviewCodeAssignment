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
        Form {
            Text(albumInfo.title).font(.largeTitle).padding().lineLimit(4)
            Text(String(albumInfo.id)).padding()
            Text(String(albumInfo.albumId)).padding()
        
            ScrollView(.vertical) {
                ScrollView(.horizontal) {
                    VStack(alignment:.leading) {

                        AsyncImage(url: URL(string: albumInfo.thumbnailUrl)) { image in
                            image
                        } placeholder: {
                            ProgressView()
                        }
                        Spacer()
                        AsyncImage(url: URL(string: albumInfo.url)) { image in
                            image
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .navigationBarTitle(Text(albumInfo.title), displayMode: .inline)
                    Spacer()
                }
            }
            .foregroundColor(Color.blue)
        }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
    }
}

// MARK: Previews
struct AlbumInfoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumInfoDetailView(albumInfo: AlbumInfoViewModel().albumInfos.first ?? AlbumInfo.defaultAlbumInfo())
    }
}
