//
//  ModelLogic.swift
//  BigBangTheoryApp
//
//  Created by Monica Galan de la Llana on 28/3/23.
//

import UIKit

final class ModelLogic {
    static let shared = ModelLogic()
    let modelPersistence = ModelPersistence.shared
    
    var episodes:[BigBangEpisode]
    
    var snapshot:NSDiffableDataSourceSnapshot<String, BigBangEpisode> {
        var snapshot = NSDiffableDataSourceSnapshot<String, BigBangEpisode>()
        snapshot.appendSections(seasons.map {"Season \($0)"})
        for season in seasons {
            let episode = episodes.filter { episode in
                episode.season == Int(season)
            }
            snapshot.appendItems(episode, toSection: "Season \(season)")
        }
        return snapshot
    }
    
    private var favorites:[Int] {
        didSet {
            try? modelPersistence.saveFavorites(ids: favorites)
        }
    }
    
    var seasons:[Int] {
        Array(Set(episodes.map(\.season))).sorted { $0 < $1 }
    }
    
    //inicialización episodes
    init() {
        do {
            self.episodes = try modelPersistence.getEpisodes()
            self.favorites = try modelPersistence.getFavorites()
        } catch {
            self.episodes = []
            self.favorites = []
        }
    }
    
    func getRows() -> Int {
        episodes.count
    }
    
    func getEpisodeRow(indexPath:IndexPath) -> BigBangEpisode {
        episodes[indexPath.row]
    }
    
    func getEpisodesBySeason(season:Int, row:Int) -> BigBangEpisode {
        let episodes = episodes.filter { episode in
            episode.season == seasons[season]
        }
        return episodes[row]
    }
    
    func isFavorite(id:Int) -> Bool {
        favorites.contains(id)
    }
    
    func toogleFavorites(id:Int) {
        if favorites.contains(id) {
            favorites.removeAll(where: { $0 == id })
        } else {
            favorites.append(id)
        }
    }
}
