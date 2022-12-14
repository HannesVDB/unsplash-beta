//
//  Configuration.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 29/09/2022.
//

import Cara

class UnsplashConfiguration: Configuration {
    var baseURL: URL? {
        return URL(string: "https://api.unsplash.com/")
    }
    
    var publicKeys: PublicKeys? {
        return nil
    }
    
    var loggers: [Logger]? {
        return nil
    }
    
    func headers(for request: Request) -> RequestHeaders? {
        return ["Authorization": "Client-ID -0RgDKf47UtzhAqmP7xy9iSZEwnj9-I5c-agpoLpcqY"]
    }
}
