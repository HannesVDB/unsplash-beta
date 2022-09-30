//
//  CollectionOverviewViewController.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 30/09/2022.
//

import UIKit

class CollectionOverviewViewController: UIViewController {
    private let viewModel: CollectionOverviewViewModel = CollectionOverviewViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    private func drawView() {
        
    }
}
