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
        
        case _ as GetSeriesAction:
            state.loading = true
        case let action as GetSeriesSuccessAction:
            state.series = action.series
            state.loading = true
        case let action as GetSeriesFailedAction:
            state.errorMessage = action.errorMessage
            state.loading = true
        
        default: break
        
    }

    return state
}
