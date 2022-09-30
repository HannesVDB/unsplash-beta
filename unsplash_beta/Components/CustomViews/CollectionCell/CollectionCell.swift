//
//  CollectionCell.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 29/09/2022.
//

import UIKit

protocol CollectionCellDelegate: AnyObject {
    func didToggleSwitch(with value: Bool, for cell: CollectionCell)
}

class CollectionCell: UITableViewCell {
    
    var selectSwithHandler:((Bool) -> Void)?
    
    @IBOutlet weak var titleLabel: UILabel!
    weak var delegate: CollectionCellDelegate?
    
    var collection: Collection? {
        didSet {
            titleLabel.text = collection?.title
        }
    }
    
    @IBAction func didToggleSwitch(_ sender: UISwitch) {
        delegate?.didToggleSwitch(with: sender.isOn, for: self)
        selectSwithHandler?(sender.isOn)
    }
}
