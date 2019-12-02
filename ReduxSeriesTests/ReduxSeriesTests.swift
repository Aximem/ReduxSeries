//
//  ReduxSeriesTests.swift
//  ReduxSeriesTests
//
//  Created by CHARRUEL Maxime on 28/11/2019.
//  Copyright © 2019 CHARRUEL Maxime. All rights reserved.
//

import XCTest
@testable import ReduxSeries
import ReSwiftThunk

class ReduxSeriesTests: XCTestCase {

    func testGetSeriesStart() {
        let action = GetSeriesStartAction()
        
        let state = serieReducer(action: action, state: nil)
        
        XCTAssert(state.loading == true)
    }
    
    func testGetSeriesSuccess() {
        let action = GetSeriesSuccessAction(series: [
            Serie(id: 1, name: "Arrow", overview: nil, backdropPath: nil),
            Serie(id: 2, name: "Supernatural", overview: nil, backdropPath: nil),
            Serie(id: 3, name: "Gotham", overview: nil, backdropPath: nil),
        ])
        
        let state = serieReducer(action: action, state: nil)
        
        XCTAssert(state.loading == false)
        XCTAssert(state.series.count == 3)
        XCTAssert(state.series[0].name == "Arrow")
        XCTAssert(state.series[1].name == "Supernatural")
        XCTAssert(state.series[2].name == "Gotham")
        XCTAssert(state.errorMessage == nil)
    }
    
    func testGetSeriesFailed() {
        let action = GetSeriesFailedAction(errorMessage: "Error")
        
        let state = serieReducer(action: action, state: nil)
        
        XCTAssert(state.loading == false)
        XCTAssert(state.series.count == 0)
        XCTAssert(state.errorMessage == "Error")
    }

}
