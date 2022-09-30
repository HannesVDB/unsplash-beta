//
//  CollectionOverviewViewModel.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 30/09/2022.
//

import Foundation

class CollectionOverviewViewModel: ViewModel {
    private let service: NetworkService
    
    private(set) var collections: [Collection]?
    
    init(service: NetworkService = WebService.shared) {
        self.service = service
    }
    
    override func reloadData() {
        service.fetchCollection { result in
            print("Collection done")
            switch result {
            case .success(let collections):
                self.collections = collections
                self.reloadHandler?()
            case .failure(let error):
                print("Failure \(error.localizedDescription)")
            }
        }
    }
}
