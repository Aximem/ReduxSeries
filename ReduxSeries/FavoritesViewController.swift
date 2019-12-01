//
//  FavoritesViewController.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 28/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import UIKit
import ReSwift

class FavoritesViewController: UIViewController, StoreSubscriber {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noFavoriteLabel: UILabel!
    
    var series: [Serie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        store.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        store.unsubscribe(self)
    }

    func newState(state: AppState) {
        
        self.series = state.serieState.series.filter { serie in state.favoriteState.favorites.contains(where: { favorite in favorite.idSerie == serie.id }) }
        self.tableView.reloadData()
        
        self.noFavoriteLabel.isHidden = !self.series.isEmpty
        
    }
}



// MARK: UITableViewDataSource, UITableViewDelegate

extension FavoritesViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.series.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: serieCellId, for: indexPath) as? SerieTableViewCell {
            
            let serie = self.series[indexPath.row]
            let isFavorite = store.state.favoriteState.favorites.contains(where: { favorite in favorite.idSerie == serie.id })
            cell.configureWith(serie: serie, favorite: isFavorite)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let serie = self.series[indexPath.row]
        let serieDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "serieDetailId") as! SerieDetailViewController
        serieDetailVC.serie = serie
        self.navigationController?.pushViewController(serieDetailVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
