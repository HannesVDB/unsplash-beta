//
//  Collection.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 30/09/2022.
//

import Foundation

public struct Collection: Codable {
    var title: String
    var coverPhoto: Photo
    
    enum CodingKeys: String, CodingKey {
        case title
        case coverPhoto = "cover_photo"
    }
}
