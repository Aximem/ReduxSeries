//
//  Redux.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 29/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import ReSwift
import ReSwiftThunk

let thunkMiddleware: Middleware<AppState> = createThunkMiddleware()

var store: Store<AppState> = Store<AppState>(reducer: appReducer, state: nil, middleware: [thunkMiddleware])
