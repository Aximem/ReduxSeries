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
        
        case _ as PostFavoriteAction:
            state.loading = true
        case let action as PostFavoriteSuccessAction:
            state.favorites.append(action.favorite)
            state.loading = false
        case let action as GetSeriesFailedAction:
            state.errorMessage = action.errorMessage
            state.loading = false
        
        case _ as DeleteFavoriteAction:
            state.loading = true
        case let action as DeleteFavoriteSuccessAction:
            state.favorites = state.favorites.filter{$0 == action.favorite}
            state.loading = false
        case let action as DeleteFavoriteFailedAction:
            state.errorMessage = action.errorMessage
            state.loading = false
        
        default: break
        
    }

    return state
}
