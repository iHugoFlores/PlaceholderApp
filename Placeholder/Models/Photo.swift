//
//  Photo.swift
//  Placeholder
//
//  Created by Hugo Flores Perez on 4/4/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let albumId, id: Int
    let title: String
    let url, thumbnailUrl: String
}
