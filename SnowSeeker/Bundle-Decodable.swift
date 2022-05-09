//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by Dom Bryan on 25/03/2022.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}

// we’re going to load an array of resorts from JSON stored in our app bundle, which means we can re-use the same code we wrote for project 8 – the Bundle-Decodable.swift extension
