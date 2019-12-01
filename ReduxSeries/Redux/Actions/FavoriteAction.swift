//
//  FavoriteAction.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 28/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import ReSwift

struct PostFavoriteStartAction: Action {}
struct PostFavoriteSuccessAction: Action {
    var favorite: Favorite
}
struct PostFavoriteFailedAction: Action {
    var errorMessage: String
}

struct DeleteFavoriteStartAction: Action {}
struct DeleteFavoriteSuccessAction: Action {
    var favorite: Favorite
}
struct DeleteFavoriteFailedAction: Action {
    var errorMessage: String
}
