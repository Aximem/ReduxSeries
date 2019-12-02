//
//  SerieSelector.swift
//  ReduxSeries
//
//  Created by Maxime Charruel on 02/12/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import Foundation

var seriesSelector: (AppState) -> [Serie] = { state in return state.serieState.series }

var seriesLoadingSelector: (AppState) -> Bool = { state in return state.serieState.loading }

var seriesErrorMessageSelector: (AppState) -> String? = { state in return state.serieState.errorMessage }
