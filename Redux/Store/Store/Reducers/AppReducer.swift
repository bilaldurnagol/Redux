//
//  AppReducer.swift
//  Redux
//
//  Created by Bilal Durnagöl on 8.04.2023.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    
    var state = state
    state.counterState = counterReducer(state.counterState, action)
    state.tastState = taskReducer(state.tastState, action)
    return state
}
