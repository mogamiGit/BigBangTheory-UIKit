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
    
    //filtrar episodes
    //episodes.filter { $0.contains("") }
    //episodes.filter { episodes.season == season }
    //let episodes = episodes.contains("\(episodes.season)")
    
    //ORIGINAL
    //snapshot.appendItems(episodes, toSection: season)
    
    var seasons:[Int] {
        Array(Set(episodes.map(\.season))).sorted { $0 < $1 }
    }
    
    init() {
        do {
            self.episodes = try modelPersistence.getEpisodes()
        } catch {
            self.episodes = []
        }
    }
}
