//
//  AlbumInfoDetailView_ViewModel.swift
//  InterviewCodeAssignment
//
//  Created by Sam Griffith on 9/21/23.
//

import Foundation
import SwiftUI

extension AlbumInfoDetailView {
    
    // ViewModel for AlbumInfoDetailView UI
    @MainActor class AlbumInfoDetailView_ViewModel: ObservableObject {
        @Published var albumInfo: AlbumInfo
 
        init(albumInfo: AlbumInfo) {
            self.albumInfo = albumInfo
        }
        
    }
}
