//
//  JSONUtil.swift
//  Placeholder
//
//  Created by Hugo Flores Perez on 4/4/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import Foundation

class JSONUtil {
    static func loadJSON<T>(fileName file: String) -> T? where T: Codable {
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            print("Error reading file: \(file)")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            return parseDataToModel(from: data)
        } catch {
            print("Error decoding data: \(error)")
            return nil
        }
    }
    
    static func parseDataToModel<T>(from data: Data) -> T? where T: Codable {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error parsing JSON: \(error)")
            return nil
        }
    }
}

