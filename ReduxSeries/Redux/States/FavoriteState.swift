//
//  FavoriteState.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 28/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import ReSwift

struct FavoriteState: StateType {
    var loading: Bool = false
    var favorites: [Favorite] = []
    var errorMessage: String? = nil
}
