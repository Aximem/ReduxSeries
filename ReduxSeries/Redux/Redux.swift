//
//  Redux.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 29/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import ReSwift

var store: Store<AppState> = Store<AppState>(reducer: appReducer, state: nil)
