//
//  FavoritesCollectionViewController.swift
//  BigBangTheoryApp
//
//  Created by Monica Galan de la Llana on 11/4/23.
//

import UIKit

class FavoritesCollectionViewController: UICollectionViewController {
    
    let modelLogic = ModelLogic.shared
    let viewLogic = ViewLogic.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        NotificationCenter.default.addObserver(forName: .favoritesChange, object: nil, queue: .main) { _ in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.reloadData()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelLogic.getFavoritesRows()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "zelda", for: indexPath) as? FavoritesViewCell,
              let episode = modelLogic.getEpisodeFromID(indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        cell.coverFavorites.image = viewLogic.getCover(episode: episode)
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .favoritesChange, object: nil)
    }
}
