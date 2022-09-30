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
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 180, height: 180)
        let view = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.register(CollectionImageViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        drawView()
        viewModel.reloadHandler = { [weak self] in
            self?.collectionView.reloadData()
        }
        viewModel.reloadData()
    }
    
    private func drawView() {
        view.addSubview(collectionView)
        collectionView.constrainToSuperview()
    }
}

extension CollectionOverviewViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.collections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionImageViewCell else {
            return UICollectionViewCell()
        }
        cell.contentView.backgroundColor = UIColor.red
        let item = viewModel.collections?[safe: indexPath.row]
        cell.collection = item
        return cell
    }
}

class CollectionImageViewCell: UICollectionViewCell {
    
    var collection: Collection? {
        didSet {
            imageView.sd_setImage(with: URL(string: collection?.coverPhoto.thumbImage))
            label.text = collection?.title
        }
    }
    
    private(set) lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private(set) lazy var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.constrainToSuperview()
        contentView.addSubview(label)
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
