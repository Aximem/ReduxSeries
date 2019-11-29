//
//  Serie.swift
//  ReduxSeries
//
//  Created by CHARRUEL Maxime on 28/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import Foundation

struct Serie: Codable, Equatable {
    let id: Int?
    let name: String?
    let overview: String?
    let backdropPath: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case overview
        case backdropPath = "backdrop_path"
    }
}
