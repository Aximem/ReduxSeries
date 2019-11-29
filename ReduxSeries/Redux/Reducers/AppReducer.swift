//
//  RootReducer.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 29/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
  return AppState(
    serieState: serieReducer(action: action, state: state?.serieState),
    favoriteState: favoriteReducer(action: action, state: state?.favoriteState)
  )
}
