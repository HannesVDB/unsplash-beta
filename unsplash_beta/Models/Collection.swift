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
    var id: String?
    var user: User?
    
    enum CodingKeys: String, CodingKey {
        case title
        case coverPhoto = "cover_photo"
        case id
        case user
    }
}

public struct User: Codable {
    var username: String
    var profileImage: Photo.PhotoURL
    var bio: String?
    enum CodingKeys: String, CodingKey {
        case username
        case profileImage = "profile_image"
        case bio
    }
}
