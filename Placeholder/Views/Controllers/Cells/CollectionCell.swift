//
//  CollectionCell.swift
//  Placeholder
//
//  Created by Hugo Flores Perez on 4/4/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    static var identifier: String = "collection_cell"
    
    var viewModel: CollectionCellViewModel = CollectionCellViewModel()
    
    let albumImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .green
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        albumImage.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        viewModel.onImageSet = setImage
        
        contentView.addSubview(albumImage)

        NSLayoutConstraint.activate([
            albumImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            albumImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            albumImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            albumImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func setImage() {
        albumImage.image = UIImage(data: viewModel.image!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
