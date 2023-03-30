//
//  ModelPersistence.swift
//  BigBangTheoryApp
//
//  Created by Monica Galan de la Llana on 28/3/23.
//

import UIKit

final class ModelPersistence {
    static let shared = ModelPersistence()
    
    private let url = Bundle.main.url(forResource: "bigbang", withExtension: "json")!
    
    func getEpisodes() throws -> [BigBangEpisode] {
        let data = try Data(contentsOf: url)
        let decodeData = try JSONDecoder().decode([BigBangEpisode].self, from: data)
        return decodeData
    }
    
    func loadImage(id:Int) throws -> UIImage? {
        let urlImage = URL.documentsDirectory.appending(path: "\(id)_cover.jpg")
        if FileManager.default.fileExists(atPath: urlImage.path()) {
            let data = try Data(contentsOf: urlImage)
            return UIImage(data: data)
        } else {
            return nil
        }
    }
}
