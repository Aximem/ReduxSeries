//
//  SeriesViewController.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 28/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import UIKit
import ReSwift

let serieCellId = "serieCellId"

class SeriesViewController: UIViewController, StoreSubscriber {

    @IBOutlet weak var tableView: UITableView!
    
    var series: [Serie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = UIColor.white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        store.subscribe(self)
    }
    
    func newState(state: AppState) {
        self.series = state.serieState.series
        self.tableView.reloadData()
    }
}

extension SeriesViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.series.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: serieCellId, for: indexPath) as? SerieTableViewCell {
            
            let serie = self.series[indexPath.row]
            let url = URL(string: urlTDMBImage + (serie.backdropPath ?? ""))
            let data = try? Data(contentsOf: url!)
            
            cell.backdropImage?.image = UIImage(data: data!)
            cell.titleLabel?.text = serie.name
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
