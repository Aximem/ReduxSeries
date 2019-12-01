//
//  AppDelegate.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 28/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import UIKit
import ReSwift

let urlTMDBSeries = "https://api.themoviedb.org/3/tv/popular?api_key=56918c56b08bf630951940f0580ef784"
let urlTDMBImage = "https://image.tmdb.org/t/p/w500"

struct TMDBPagedResult: Codable {
    let results: [Serie]
    let page: Int
    let totalPages: Int
    let totalResults: Int

    private enum CodingKeys: String, CodingKey {
        case results
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        store.dispatch(GetSeriesAction())
        
        APIServices.getSeries() { series, errorMessage in
            if errorMessage != nil {
                store.dispatch(GetSeriesFailedAction(errorMessage: errorMessage!))
                return
            }
            store.dispatch(GetSeriesSuccessAction(series: series ?? []))
        }
        
        return true
    }
    
}

