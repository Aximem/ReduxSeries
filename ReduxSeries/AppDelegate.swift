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
        
        self.getSeries() { series, errorMessage in
            if errorMessage != nil {
                store.dispatch(GetSeriesFailedAction(errorMessage: errorMessage!))
                return
            }
            store.dispatch(GetSeriesSuccessAction(series: series ?? []))
        }
        
        return true
    }

    func getSeries(completionHandler: @escaping ([Serie]?, String?) -> Void) {

        guard let url = URL(string: urlTMDBSeries) else { return completionHandler(nil, "Url invalid") }

        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                
                guard
                    let data = data,
                    let tmdbPageResult = try? JSONDecoder().decode(TMDBPagedResult.self, from: data)
                else {
                    return completionHandler(nil, "Something went wrong")
                }
                completionHandler(tmdbPageResult.results, nil)
                
            }
        }

        task.resume()
        
    }
    
}

