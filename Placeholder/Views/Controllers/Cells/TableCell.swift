//
//  TableCell.swift
//  Placeholder
//
//  Created by Hugo Flores Perez on 4/4/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    static var identifier: String = "table_cell"
    static var imageSize: CGFloat = 90
    private var cellMargins: CGFloat = 16
    
    var viewModel: TableCellViewModel = TableCellViewModel()

    let albumImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .red
        iv.clipsToBounds = true
        NSLayoutConstraint.activate([
            iv.widthAnchor.constraint(equalToConstant: imageSize),
            iv.heightAnchor.constraint(equalToConstant: imageSize),
        ])
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.font = UIFont(name: "Arial", size: 12)
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Loading..."
        lb.textAlignment = .left
        lb.numberOfLines = 2
        return lb
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpMainContainer()
        
        viewModel.onDataSet = updateView
        viewModel.onImageSet = setImage
    }
    
    func setUpMainContainer() {
        let sv = UIStackView(arrangedSubviews: [albumImage, nameLabel])
        sv.axis = .horizontal
        sv.alignment = .center
        sv.spacing = 4
        sv.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sv)
        
        NSLayoutConstraint.activate([
            sv.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -cellMargins),
            sv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: cellMargins),
            sv.topAnchor.constraint(equalTo: contentView.topAnchor, constant: cellMargins),
            sv.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -cellMargins),
        ])
    }
    
    func updateView() {
        nameLabel.text = viewModel.photo?.title
    }
    
    func setImage() {
        albumImage.image = viewModel.image
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
