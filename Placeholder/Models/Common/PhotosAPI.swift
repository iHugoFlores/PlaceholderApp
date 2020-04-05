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
    private static let mockResponseTime: Double = 0.1
    
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
    
    static func downloadImage(from url: URL, onDone: @escaping (Data?) -> ()) {
        downloadData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                onDone(nil)
                return
            }
            DispatchQueue.main.async() {
                onDone(data)
            }
        }
        /*
        do {
            let res = try Data(contentsOf: url)
            DispatchQueue.main.async() {
                onDone(res)
            }
        } catch {
            DispatchQueue.main.async() {
                onDone(nil)
            }
        }
        */
    }
}
