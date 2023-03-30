//
//  ViewLogic.swift
//  BigBangTheoryApp
//
//  Created by Monica Galan de la Llana on 28/3/23.
//

import UIKit

final class ViewLogic {
    static let shared = ViewLogic()
    let modelPersistence = ModelPersistence.shared
    
    func getCover(episode:BigBangEpisode) -> UIImage? {
        if let cover = try? modelPersistence.loadImage(id: episode.id) {
            return cover
        } else {
            return UIImage(named: episode.image)
        }
    }
}
