//
//  AppState.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 29/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import ReSwift

struct AppState: StateType {
  var serieState: SerieState = SerieState()
  var favoriteState: FavoriteState = FavoriteState()
}
