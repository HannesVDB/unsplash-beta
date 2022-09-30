//
//  WelcomeViewModel.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 30/09/2022.
//

import Foundation

class WelcomeViewModel: ViewModel {
    
    private let service: NetworkService
    private(set) var randomImageURL: URL?
    
    init(service: NetworkService = WebService.shared) {
        self.service = service
    }
    
    override func reloadData() {
        fetchRandomImage()
    }
    
    private func fetchRandomImage() {
        service.fetchRandom { [weak self] result in
            guard let self = self else { return }
            print("Fetch image")
            switch result {
            case .success(let link):
                guard let link = link,
                      let url = URL(string: link) else {
                    return
                }
                self.randomImageURL = url
                self.reloadHandler?()
            case .failure(let error):
                self.errorHandler?(error)
            }
        }
    }
}
