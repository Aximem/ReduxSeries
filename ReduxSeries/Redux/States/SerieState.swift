//
//  SerieState.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 28/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import ReSwift

struct SerieState: StateType {
    var loading: Bool = false
    var series: [Serie] = []
    var errorMessage: String? = nil
}
