//
//  AlbumInfo.swift
//  InterviewCodeAssignment
//
//  Created by Sam Griffith on 9/18/23.
//

import Foundation

struct AlbumInfo: Identifiable, Codable, Hashable {
    var albumId : Int
    var id : Int
    var title : String
    var url : String
    var thumbnailUrl : String
    
    
    static func defaultAlbumInfo() -> AlbumInfo {
        return AlbumInfo(albumId: -1,
                         id: -1,
                         title: "Default Album Info",
                         url: "https://cdn.icon-icons.com/icons2/3053/PNG/512/swift_playgrounds_alt_macos_bigsur_icon_189677.png",
                         thumbnailUrl: "https://cdn.icon-icons.com/icons2/3053/PNG/64/swift_playgrounds_alt_macos_bigsur_icon_189677.png")
    }
}
