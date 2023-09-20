//
//  AlbumInfoViewModel.swift
//  InterviewCodeAssignment
//
//  Created by Sam Griffith on 9/18/23.
//

import Foundation

class AlbumInfoViewModel: ObservableObject {
    @Published var albumInfos: [AlbumInfo] = []
    @Published var isLoading: Bool = false
    
    func fetchAlbumInfos() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums/1/photos") else { return }
        
        isLoading = true
        URLSession.shared.dataTask(with: url) { (jsonData, response, error) in
            // Check for successful request and if not fail
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                // TODO - Don't just do fatal app failure, but set a fail code on service and update it so
                // application can show error dialog
                fatalError("Error retrieving album info data: \(String(describing: error))")
            }
            
            // No error so get data
            if let data = jsonData {
                if let decodedAlbumInfos = try? JSONDecoder().decode([AlbumInfo].self, from: data) {
                    DispatchQueue.main.async {
//                        sleep(2)

                        self.albumInfos = decodedAlbumInfos
                        self.isLoading = false
                    }
                }
            }
        }.resume()
            }
}
