//
//  FavoritesViewCell.swift
//  BigBangTheoryApp
//
//  Created by Monica Galan de la Llana on 11/4/23.
//

import UIKit

class FavoritesViewCell: UICollectionViewCell {
    @IBOutlet weak var coverFavorites: UIImageView!
    
    override func awakeFromNib() {
        coverFavorites.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        coverFavorites.image = nil
    }
}
