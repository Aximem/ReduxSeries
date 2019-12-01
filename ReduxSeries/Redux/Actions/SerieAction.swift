//
//  SerieAction.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 28/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import ReSwift

struct GetSeriesStartAction: Action {}
struct GetSeriesSuccessAction: Action {
    var series: [Serie] = []
}
struct GetSeriesFailedAction: Action {
    var errorMessage: String
}
