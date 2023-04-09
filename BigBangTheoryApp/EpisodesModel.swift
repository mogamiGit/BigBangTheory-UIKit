//
//  EpisodesModel.swift
//  BigBangTheoryApp
//
//  Created by Monica Galan de la Llana on 28/3/23.
//

import Foundation

struct BigBangEpisode:Codable, Hashable {
    let id: Int
    let url: URL
    let name: String
    let season, number: Int
    let airdate: String
    let runtime: Int
    let image: String
    let summary: String
}

extension BigBangEpisode {
    var formattedAirDate:String {
        airdate.convertToMonthYearString() ?? "Unknown"
    }
}
