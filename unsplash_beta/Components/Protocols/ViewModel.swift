//
//  ViewModel.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 30/09/2022.
//

import Foundation

protocol ViewModelConvertable {
    var errorHandler:((Error) -> Void)? { get set }
    var reloadHandler:(() -> Void)? { get set }
    func reloadData()
}

class ViewModel: ViewModelConvertable {
    var errorHandler: ((Error) -> Void)?
    
    var reloadHandler: (() -> Void)?
    
    func reloadData() {}
}
