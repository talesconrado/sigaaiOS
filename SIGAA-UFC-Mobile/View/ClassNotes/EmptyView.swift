//
//  EmptyView.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 21/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class EmptyView: UIView {
    
    let image: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "prancheta")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    let text: UILabel = {
        let txt = UILabel()
        txt.text = "Nada por aqui ainda."
        txt.textColor = .lightGray
        txt.textAlignment = .center
        txt.translatesAutoresizingMaskIntoConstraints = false
        
        return txt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(image)
        addSubview(text)
        
        NSLayoutConstraint.activate([
        
            image.heightAnchor.constraint(equalToConstant: 200),
            image.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            
            text.centerXAnchor.constraint(equalTo: centerXAnchor),
            text.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10)
        
        ])
        
    }
}

extension UITableView {

    func setEmptyState() {
        let emptyView = EmptyView()
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func restoreState() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
