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
    
    private lazy var welcomeView: WelcomeView = {
        let view = WelcomeView()
        view.tapHandler = {
            let controller = CollectionOverviewViewController()
            let navigation = UINavigationController(rootViewController: controller)
            navigation.modalPresentationStyle = .fullScreen
            self.present(navigation, animated: true)
        }
        return view
    }()
    
    // MARK: Views
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = welcomeView
        
        viewModel?.reloadHandler = { [weak self] in
            if let view = self?.view as? WelcomeView {
                view.updateImage(self?.viewModel?.randomImageURL)
            }
        }
        viewModel?.errorHandler = { error in
            print("💣 error occured \(error.localizedDescription)")
        }
        viewModel?.reloadData()
    }
    
}
