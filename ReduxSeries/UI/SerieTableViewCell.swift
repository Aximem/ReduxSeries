//
//  SerieTableViewCell.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 29/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import UIKit
import SDWebImage

class SerieTableViewCell: UITableViewCell {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var fadeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backdropImageView.contentMode = .scaleAspectFill
        self.fadeView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureWith(serie: Serie, favorite: Bool) {
        self.backdropImageView?.sd_setImage(with: URL(string: urlTDMBImage + (serie.backdropPath ?? "")), placeholderImage: nil)
        self.titleLabel?.text = serie.name
        self.favoriteImageView.isHidden = !favorite
    }
    
}
