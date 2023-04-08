//
//  Store.swift
//  Redux
//
//  Created by Bilal Durnagöl on 8.04.2023.
//

import Foundation

typealias Reducer =  (_ state: State, _ action: Action) -> State

struct State {
    var counter: Int = 0
    var movies = [String]()
}

protocol Action { }

struct IncrementAction: Action { }
struct DecrementAction: Action { }

struct GetMoviesAction: Action {
    let movies: [String]
}

struct AddAction: Action {
    let value: Int
}

func reducer(_ state: State, _ action: Action) -> State {
    
    var state = state
    
    switch action {
    case _ as IncrementAction:
        state.counter += 1
    case _ as DecrementAction:
        state.counter -= 1
    case let action as AddAction:
        state.counter += action.value
    case let action as GetMoviesAction:
        state.movies = action.movies
    default:
        break
    }
    
    return state
}

class Store: ObservableObject {
    
    var reducer: Reducer
    @Published var  state: State
    
    init(reducer: @escaping Reducer, state: State = State()) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: Action) {
        state = reducer(state, action)
    }
    
}
