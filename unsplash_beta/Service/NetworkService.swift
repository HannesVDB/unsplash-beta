//
//  NetworkService.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 29/09/2022.
//

import Cara

public protocol NetworkService {
    func fetchRandom(result: @escaping ((Result<String?, Error>) -> Void))
    func fetchCollection(result: @escaping ((Result<[Collection]?, Error>) -> Void))
    func fetchCollectionDetail(id: String?, result: @escaping ((Result<Collection?, Error>) -> Void))

}

public class WebService: NetworkService {
    
    public func fetchRandom(result: @escaping ((Result<String?, Error>) -> Void)) {
        let request = RandomPhotoRequest()
        let serializer = CodableSerializer<Photo>()
        service.execute(request, with: serializer) { response in
            switch response {
            case .success(let photo):
                result(.success(photo?.fullResImage))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func fetchCollection(result: @escaping ((Result<[Collection]?, Error>) -> Void)) {
        let request = CollectionRequest()
        let serializer = CodableSerializer<[Collection]>()
        service.execute(request, with: serializer) { response in
            switch response {
            case .success(let collections):
                result(.success(collections))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func fetchCollectionDetail(id: String?, result: @escaping ((Result<Collection?, Error>) -> Void)) {
        let request = CollectionRequest(id: id)
        let serializer = CodableSerializer<Collection>()
        service.execute(request, with: serializer) { response in
            switch response {
            case .success(let collection):
                result(.success(collection))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Properties

    static let shared = WebService()

    // MARK: Private

    internal let service: Service
    private let configuration: Configuration

    init(configuration: Configuration = UnsplashConfiguration(), service: Service? = nil) {
        self.configuration = configuration
        if let service = service {
            self.service = service
        } else {
            self.service = Service(configuration: configuration)
        }
    }
}
