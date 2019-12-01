//
//  SerieTableViewCell.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 29/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import UIKit

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
        self.backdropImageView?.imageFromServerURL(urlString: urlTDMBImage + (serie.backdropPath ?? ""))
        self.titleLabel?.text = serie.name
        self.favoriteImageView.isHidden = !favorite
    }
    
}

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        self.image = nil
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })

        }).resume()
    }
}
