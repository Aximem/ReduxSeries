//
//  SerieTableViewCell.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 29/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import UIKit

class SerieTableViewCell: UITableViewCell {

    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var fadeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backdropImage.contentMode = .scaleAspectFill
        self.fadeView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
