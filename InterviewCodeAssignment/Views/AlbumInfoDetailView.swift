//
//  AlbumDetailView.swift
//  InterviewCodeAssignment
//
//  Created by Sam Griffith on 9/18/23.
//

import Foundation
import SwiftUI
import os


struct AlbumInfoDetailView : View {
    private let lgr = Logger()
    @StateObject private var viewModel : AlbumInfoDetailView_ViewModel
    
    // Init our viewModel in the StateObject supplied by our calling View, in this case AlbumInfoListView
     init(viewModel: AlbumInfoDetailView_ViewModel) {
         _viewModel = StateObject(wrappedValue: viewModel)
     }
    
    var body: some View {
        Form {
            Text(viewModel.albumInfo.title).font(.largeTitle).padding().lineLimit(4)
            Text(String(viewModel.albumInfo.id)).padding()
            Text(String(viewModel.albumInfo.albumId)).padding()
        
            ScrollView(.vertical) {
                ScrollView(.horizontal) {
                    VStack(alignment:.leading) {
                        AsyncImage(url: URL(string: viewModel.albumInfo.thumbnailUrl)) { image in
                            image
                        } placeholder: {
                            ProgressView()
                        }
                        Spacer()
                        AsyncImage(url: URL(string: viewModel.albumInfo.url)) { image in
                            image
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .navigationBarTitle(Text(viewModel.albumInfo.title), displayMode: .inline)
                    Spacer()
                }
            }
            .foregroundColor(Color.blue)

        }
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))

    }
}

// MARK: Previews

struct AlbumInfoDetailView_Previews: PreviewProvider {
    static let vm  = AlbumInfoDetailView.AlbumInfoDetailView_ViewModel(albumInfo: AlbumInfo.defaultAlbumInfo())

    static var previews: some View {
        AlbumInfoDetailView(viewModel: vm)
    }
}
