//
//  EpisodesViewCell.swift
//  BigBangTheoryApp
//
//  Created by Monica Galan de la Llana on 28/3/23.
//

import UIKit

class EpisodesViewCell: UITableViewCell {
    @IBOutlet weak var numberEpisodeLabel: UILabel!
    @IBOutlet weak var nameEpisodeLabel: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        numberEpisodeLabel.text = nil
        nameEpisodeLabel.text = nil
        episodeImage.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
