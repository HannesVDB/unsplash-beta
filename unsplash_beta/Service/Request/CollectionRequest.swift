//
//  CollectionRequest.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 30/09/2022.
//

import Cara

struct CollectionRequest: Request {
    var id: String?
    
    var url: URL? {
        if let id = id {
            return URL(string: "collections/\(id)")
        }
        return URL(string: "collections")
    }
    
    var method: RequestMethod {
        return .get
    }
}
