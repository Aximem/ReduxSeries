//
//  SerieReducer.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 28/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import ReSwift

func serieReducer(action: Action, state: SerieState?) -> SerieState {
    
    var state = state ?? SerieState()

    switch action {
        
        case _ as GetSeriesStartAction:
            state.loading = true
        case let action as GetSeriesSuccessAction:
            state.series = action.series
            state.loading = false
        case let action as GetSeriesFailedAction:
            state.errorMessage = action.errorMessage
            state.loading = false
        
        default: break
        
    }

    return state
}
