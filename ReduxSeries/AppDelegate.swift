//
//  AppDelegate.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 28/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import UIKit
import ReSwift

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

