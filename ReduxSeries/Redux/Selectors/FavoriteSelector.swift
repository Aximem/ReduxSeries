//
//  FavoriteSelector.swift
//  ReduxSeries
//
//  Created by Maxime Charruel on 02/12/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import Foundation

var favoriteSeriesSelector: (AppState) -> [Serie] = { state in return state.serieState.series.filter { serie in state.favoriteState.favorites.contains(where: { favorite in favorite.idSerie == serie.id }) } }

var isSerieFavoriteSelector: (AppState, Serie) -> Bool = { state, serie in return store.state.favoriteState.favorites.contains(where: { favorite in favorite.idSerie == serie.id }) }

var favoriteLoadingSelector: (AppState) -> Bool = { state in return state.favoriteState.loading }

var favoriteErrorMessageSelector: (AppState) -> String? = { state in return state.favoriteState.errorMessage }
