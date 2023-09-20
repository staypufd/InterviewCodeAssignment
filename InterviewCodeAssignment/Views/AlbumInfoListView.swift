//
//  AlbumListView.swift
//  InterviewCodeAssignment
//
//  Created by Sam Griffith on 9/18/23.
//

import SwiftUI

// MARK: - Main Nav View
struct AlbumInfoListView: View {
    @ObservedObject var viewModel = AlbumInfoViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.albumInfos) { albumInfo in
                NavigationLink(destination: AlbumInfoDetailView(albumInfo: albumInfo)) {
                    VStack(alignment: .leading) {
                        Text(albumInfo.title.capitalized)
                            .font(.custom("Futura", size: 18, relativeTo: .title))
                            .truncationMode(.tail)
                            .lineLimit(1)
                        
                        // So we can give percentage values to the Text objects in the HStack
                        GeometryReader { geometry in
                            HStack {
                                Text("Id: \(albumInfo.id)")
                                    .frame(width: geometry.size.width * 0.20,
                                           alignment: .leading)
                                    .fontWeight(.thin)
                                Text("AlbumId: \(albumInfo.albumId)")
                                    .frame(width: geometry.size.width * 0.80,
                                           alignment: .leading)
                                    .fontWeight(.thin)
                            }
                            .padding(0)
                        }
                    }
                }
            }
            //          .scrollContentBackground(.hidden) // Hides the content background
            //          .background(Color.blue) // Sets the color that will show when content background is hidden
            .navigationTitle("Albums")
            .toolbarBackground(
                Color.blue,
                for: .navigationBar) // Sets the navigation bar background color
            .toolbarBackground(.visible, for: .navigationBar) // Make the toolbar show the background color
            .navigationBarTitleDisplayMode(.large) // When set to .inline it the space after the NavigationBar and before the list
            .onAppear(perform: viewModel.fetchAlbumInfos)
        }
        
    }
}

// MARK: Previews
struct AlbumInfoListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumInfoListView()
    }
}

