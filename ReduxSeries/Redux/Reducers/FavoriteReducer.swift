//
//  FavoriteReducer.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 28/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import ReSwift

func favoriteReducer(action: Action, state: FavoriteState?) -> FavoriteState {
    
    var state = state ?? FavoriteState()

    switch action {
        
        case _ as PostFavoriteStartAction:
            state.loading = true
        case let action as PostFavoriteSuccessAction:
            state.favorites.append(action.favorite)
            state.loading = false
        case let action as GetSeriesFailedAction:
            state.errorMessage = action.errorMessage
            state.loading = false
        
        case _ as DeleteFavoriteStartAction:
            state.loading = true
        case let action as DeleteFavoriteSuccessAction:
            state.favorites = state.favorites.filter{$0.idSerie != action.favorite.idSerie}
            state.loading = false
        case let action as DeleteFavoriteFailedAction:
            state.errorMessage = action.errorMessage
            state.loading = false
        
        default: break
        
    }

    return state
}
