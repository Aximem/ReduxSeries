//
//  Thunk.swift
//  ReduxSeries
//
//  Created by Maxime Charruel on 01/12/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import ReSwift
import ReSwiftThunk

let getSeries = Thunk<AppState> { dispatch, getState in
    
    dispatch(GetSeriesStartAction())
    
    APIServices.getSeries() { series, errorMessage in
        if errorMessage != nil {
            dispatch(GetSeriesFailedAction(errorMessage: errorMessage!))
            return
        }
        dispatch(GetSeriesSuccessAction(series: series ?? []))
    }
    
}

func addFavorite(_ favorite: Favorite) -> Thunk<AppState> {
    
    return Thunk<AppState> { dispatch, getState in
    
        dispatch(PostFavoriteStartAction())
        
        APIServices.addFavorite(favorite: favorite) { favorite, errorMessage in
            if errorMessage != nil {
                dispatch(PostFavoriteFailedAction(errorMessage: errorMessage!))
                return
            }
            dispatch(PostFavoriteSuccessAction(favorite: favorite!))
        }
        
    }
    
}

func deleteFavorite(_ favorite: Favorite) -> Thunk<AppState> {
    
    return Thunk<AppState> { dispatch, getState in
    
        dispatch(DeleteFavoriteStartAction())
        
        APIServices.deleteFavorite(favorite: favorite) { favorite, errorMessage in
            if errorMessage != nil {
                dispatch(DeleteFavoriteFailedAction(errorMessage: errorMessage!))
                return
            }
            dispatch(DeleteFavoriteSuccessAction(favorite: favorite!))
        }
        
    }
    
}
