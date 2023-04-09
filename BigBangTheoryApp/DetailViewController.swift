//
//  DetailViewController.swift
//  BigBangTheoryApp
//
//  Created by Monica Galan de la Llana on 8/4/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var summaryDetail: UILabel!
    @IBOutlet weak var episodeNumberDetail: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var titleEpisodeDetail: UILabel!
    @IBOutlet weak var imageEpisodeDetail: UIImageView!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airdateLabel: UILabel!
    
    @IBAction func watchEpisode(_ sender: UIButton) {
        let urlString = (selectedEpisode?.url.absoluteString)!
        
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
    
    let viewLogic = ViewLogic.shared
    
    var selectedEpisode:BigBangEpisode?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedEpisode {
            titleEpisodeDetail.text = selectedEpisode.name
            seasonLabel.text = "Season \(selectedEpisode.season)"
            summaryDetail.text = selectedEpisode.summary
            episodeNumberDetail.text = "Episode \(selectedEpisode.number)"
            runtimeLabel.text = "\(selectedEpisode.runtime) min"
            airdateLabel.text = selectedEpisode.formattedAirDate
            imageEpisodeDetail.image = viewLogic.getCover(episode: selectedEpisode)
        }
    }

}
