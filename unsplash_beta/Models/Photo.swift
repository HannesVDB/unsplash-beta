//
//  Photo.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 29/09/2022.
//

import Foundation

struct Photo: Codable {
    var id: String
    var urls: PhotoURL?
    
    struct PhotoURL: Codable {
        var full: String?
    }
    
    var fullResImage: String? {
        return urls?.full
    }
}
