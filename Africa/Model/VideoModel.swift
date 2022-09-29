//
//  VideoModel.swift
//  Africa
//
//  Created by Jersy Fernandes on 31/08/2022.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
