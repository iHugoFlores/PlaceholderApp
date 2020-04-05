//
//  TableCellViewModel.swift
//  Placeholder
//
//  Created by Hugo Flores Perez on 4/4/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit

class TableCellViewModel {
    
    var onDataSet: (() -> Void)?
    var onImageSet: (() -> Void)?

    var photo: Photo? {
        didSet {
            guard let onDataSet = onDataSet else { return }
            onDataSet()
            downloadImage()
        }
    }
    
    var image: UIImage? {
        didSet {
            guard let onImageSet = onImageSet else { return }
            onImageSet()
        }
    }
    
    func downloadImage() {
        PhotosAPI.downloadImage(from: URL(string: photo!.thumbnailUrl)!, onDone: setDownloadedImage(image:))
    }
    
    func setDownloadedImage(image imgData: Data?) {
        guard let image = imgData else { return }
        self.image = UIImage(data: image)
    }

}
