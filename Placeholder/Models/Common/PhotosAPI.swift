//
//  PhotosAPI.swift
//  Placeholder
//
//  Created by Hugo Flores Perez on 4/4/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import Foundation

class PhotosAPI {
    private static let dataJsonFilename: String = "photos"
    private static let endpoint: String = "https://jsonplaceholder.typicode.com/photos"
    private static let mockResponseTime: Double = 5
    
    // MARK: Mock Implementations
    static func getMockData(onDone: @escaping ([Photo]?) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + mockResponseTime) {
            let res: [Photo]? = JSONUtil.loadJSON(fileName: dataJsonFilename)
            onDone(res)
        }
    }
    
    // MARK: HTTP Calls
    static func downloadData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    static func downloadPhotoData(onDone: @escaping ([Photo]?) -> ()) {
        downloadData(from: URL(string: endpoint)!) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async() {
                    onDone(nil)
                }
                return
            }
            guard let photoData: [Photo]? = JSONUtil.parseDataToModel(from: data) else {
                DispatchQueue.main.async() {
                    onDone(nil)
                }
                return
            }

            DispatchQueue.main.async() {
                onDone(photoData)
            }
        }
    }
    
    static func downloadImage(from url: URL, onDone: @escaping (Data?) -> ()) {
        downloadData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async() {
                    onDone(nil)
                }
                return
            }

            DispatchQueue.main.async() {
                onDone(data)
            }
        }
    }
}
