//
//  CollectionDetailViewController.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 30/09/2022.
//

import UIKit

class CollectionDetailViewController: UIViewController {
    
    var viewModel: CollectionDetailViewModel?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var ownerBioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.reloadHandler = {
            self.profileImageView.sd_setImage(with: URL(string: self.viewModel?.collection?.user?.profileImage.large))
            self.ownerNameLabel.text = self.viewModel?.collection?.user?.username
            self.ownerBioLabel.text = self.viewModel?.collection?.user?.bio

        }
        viewModel?.reloadData()
    }
}
