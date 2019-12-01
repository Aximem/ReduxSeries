//
//  SerieDetailViewController.swift
//  ReduxSeries
//
//  Created by Maxime Charruel on 30/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import UIKit
import ReSwift

class SerieDetailViewController: UIViewController, StoreSubscriber {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    var serie: Serie!
    var isFavorite: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backdropImageView?.sd_setImage(with: URL(string: urlTDMBImage + (serie.backdropPath ?? "")), placeholderImage: nil)
        self.backdropImageView.contentMode = .scaleAspectFill
        self.titleLabel?.text = serie.name
        self.descriptionLabel?.text = serie.overview
        self.activityIndicatorView.isHidden = true
        self.activityIndicatorView.startAnimating()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        store.subscribe(self) { subcription in
            subcription.select { state in state.favoriteState }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        store.unsubscribe(self)
    }
    
    @IBAction func onFavoritePress() {
        
        let favorite = Favorite(idSerie: self.serie.id, createdAt: Date())
        
        if self.isFavorite {
            
            // Delete Favorite
            store.dispatch(deleteFavorite(favorite))
            
        } else {
            
            // Add favorite
            store.dispatch(addFavorite(favorite))
            
        }
        
    }
    
    func newState(state: FavoriteState) {
        
        self.activityIndicatorView.isHidden = !state.loading
        self.favoriteButton.isHidden = state.loading
        
        if state.favorites.contains(where: { favorite in favorite.idSerie == self.serie.id }) {
            
            self.isFavorite = true
            self.favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
            
        } else {
            
            self.isFavorite = false
            self.favoriteButton.setImage(UIImage(named: "favorite-gray"), for: .normal)
            
        }
        
    }
    
}
