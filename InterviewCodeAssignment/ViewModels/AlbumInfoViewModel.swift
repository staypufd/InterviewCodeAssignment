//
//  AlbumInfoViewModel.swift
//  InterviewCodeAssignment
//
//  Created by Sam Griffith on 9/18/23.
//

import Foundation

class AlbumInfoViewModel: ObservableObject {
    @Published var albumInfos: [AlbumInfo] = []
    
    func fetchAlbumInfos() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums/1/photos") else { return }
        
        URLSession.shared.dataTask(with: url) { (jsonData, response, error) in
            if let data = jsonData {
                if let decodedAlbumInfos = try? JSONDecoder().decode([AlbumInfo].self, from: data) {
                    DispatchQueue.main.async {
                        self.albumInfos = decodedAlbumInfos
                    }
                }
            }
        }.resume()
    }
}
