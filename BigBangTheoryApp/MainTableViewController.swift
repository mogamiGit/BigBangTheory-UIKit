//
//  MainTableViewController.swift
//  BigBangTheoryApp
//
//  Created by Monica Galan de la Llana on 28/3/23.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let modelLogic = ModelLogic.shared
    let viewLogic = ViewLogic.shared
    
    lazy var dataSource:EpisodesDiffableDataSource = {
        EpisodesDiffableDataSource(tableView: tableView) { [self] tableView, indexPath, episode in
            let cell = tableView.dequeueReusableCell(withIdentifier: "zelda", for: indexPath) as? EpisodesViewCell
            
            cell?.numberEpisodeLabel.text = "Episode \(episode.number)"
            cell?.nameEpisodeLabel.text = "\(episode.name)"
            cell?.episodeImage.image = viewLogic.getCover(episode: episode)
            
            return cell
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataSource
        dataSource.apply(modelLogic.snapshot)
    }

    // MARK: - Table view data source
    
    /*
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
    }
    */
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detail",
            let detail = segue.destination as? DetailViewController,
            let cell = sender as? UITableViewCell,
            let cellIndexPath = tableView.indexPath(for: cell) else { return }
        
        let episode = modelLogic.getEpisodesBySeason(season: cellIndexPath.section, row: cellIndexPath.row)
        detail.selectedEpisode = episode
    }

}
