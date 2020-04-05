//
//  CollectionCellViewModel.swift
//  Placeholder
//
//  Created by Hugo Flores Perez on 4/4/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit

class CollectionCellViewModel {
    
    var onImageSet: (() -> Void)?

    var photo: Photo? {
        didSet {
            downloadImage()
        }
    }
    
    var image: Data? {
        didSet {
            guard let onImageSet = onImageSet else { return }
            onImageSet()
        }
    }
    
    func downloadImage() {
        PhotosAPI.downloadImage(from: URL(string: photo!.thumbnailUrl)!, onDone: setDownloadedImage(image:))
    }
    
    func setDownloadedImage(image imgData: Data?) {
        self.image = imgData
    }

}
