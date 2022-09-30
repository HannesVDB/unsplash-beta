//
//  CollectionDetailViewModel.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 30/09/2022.
//

import Foundation

class CollectionDetailViewModel: ViewModel {
    private let service: NetworkService
    private let id: String
    private(set) var collection: Collection?
    
    init(id: String, service: NetworkService = WebService.shared) {
        self.id = id
        self.service = service
    }
    
    override func reloadData() {
        service.fetchCollectionDetail(id: id) { result in
            switch result {
            case .success(let collection):
                self.collection = collection
                self.reloadHandler?()
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
}
