//
//  DetailViewController.swift
//  BigBangTheoryApp
//
//  Created by Monica Galan de la Llana on 8/4/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var summaryDetail: UILabel!
    @IBOutlet weak var seasonLabelDetail: UILabel!
    @IBOutlet weak var titleEpisodeDetail: UILabel!
    @IBOutlet weak var imageEpisodeDetail: UIImageView!
    
    var selectedEpisode:BigBangEpisode?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        titleEpisodeDetail.text = selectedEpisode?.name
        seasonLabelDetail.text = "Season \(selectedEpisode?.season ?? 0)"
        summaryDetail.text = selectedEpisode?.summary
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
