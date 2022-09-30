//
//  CollectionRequest.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 30/09/2022.
//

import Cara

struct CollectionRequest: Request {
    var url: URL? {
        return URL(string: "collections")
    }
    
    var method: RequestMethod {
        return .get
    }
}
