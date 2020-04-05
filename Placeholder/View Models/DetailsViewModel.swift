//
//  DetailsViewModel.swift
//  Placeholder
//
//  Created by Hugo Flores Perez on 4/5/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit

class DetailsViewModel: UIView {

    var onImageSet: (() -> Void)? {
        didSet {
            if image != nil {
                onImageSet!()
            }
        }
    }
    
    var image: Data? {
           didSet {
                guard let onImageSet = onImageSet else { return }
                onImageSet()
           }
       }
    
    var photo: Photo? {
        didSet {
            downloadImage()
        }
    }

    func downloadImage() {
        PhotosAPI.downloadImage(from: URL(string: photo!.url)!, onDone: setDownloadedImage(image:))
    }
    
    func setDownloadedImage(image imgData: Data?) {
        self.image = imgData
    }

}
