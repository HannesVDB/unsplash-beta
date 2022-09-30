//
//  WelcomeViewController.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 30/09/2022.
//

import UIKit
import SDWebImage
import Stella

class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: WelcomeViewModel?
    
    // MARK: Views
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .label
        return view
    }()
    
    private lazy var imageView: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawView()
        viewModel?.reloadHandler = { [weak self] in
            self?.imageView.sd_setImage(with: self?.viewModel?.randomImageURL)
        }
        viewModel?.errorHandler = { error in
            print("💣 error occured \(error.localizedDescription)")
        }
        viewModel?.reloadData()
    }
    
    // MARK: - Methods
    
    private func drawView() {
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(imageView)
        imageView.constrainToSuperview()
        view.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        titleLabel.text = "Welcome"
    }
}
