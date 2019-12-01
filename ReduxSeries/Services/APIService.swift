//
//  APIService.swift
//  ReduxSeries
//
//  Created by Maxime Charruel on 01/12/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import Foundation

class APIServices {
    
    static func getSeries(completionHandler: @escaping ([Serie]?, String?) -> Void) {

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
    
    static func addFavorite(favorite: Favorite, completionHandler: @escaping (Favorite?, String?) -> Void) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
           
            completionHandler(favorite, nil)
            
        }
        
    }
    
    static func deleteFavorite(favorite: Favorite, completionHandler: @escaping (Favorite?, String?) -> Void) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
           
            completionHandler(favorite, nil)
            
        }
        
    }
    
}
