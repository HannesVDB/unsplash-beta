//
//  WelcomeView.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 30/09/2022.
//

import Foundation
import UIKit

class WelcomeView: UIView {
    
    var tapHandler:(() -> Void)?
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .label
        return view
    }()
    
    private lazy var imageView: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var nextButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitleColor(.white, for: .normal)
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .black
        view.configuration = configuration
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Next", for: .normal)
        view.addTarget(self, action: #selector(didTapNext(_:)), for: .touchUpInside)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        draw()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func draw() {
        backgroundColor = UIColor.systemBackground
        addSubview(imageView)
        imageView.constrainToSuperview()
        addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.text = "Welcome"
        addSubview(nextButton)
        nextButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
    }
    
    func updateImage(_ link: URL?) {
        print("Update image")
        imageView.sd_setImage(with: link)
    }
    
    @objc private func didTapNext(_ sender: UIButton) {
        tapHandler?()
    }
}
