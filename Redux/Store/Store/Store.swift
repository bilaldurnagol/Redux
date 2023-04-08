//
//  Store.swift
//  Redux
//
//  Created by Bilal Durnagöl on 8.04.2023.
//

import Foundation

typealias Reducer<State: ReduxState> =  (_ state: State, _ action: Action) -> State

protocol ReduxState { }

struct AppState: ReduxState {
    var counterState = CounterState()
    var tastState = TaskState()
}

struct TaskState: ReduxState {
    var tasks: [Task] = [Task]()
}

struct CounterState: ReduxState {
    var counter = 0
}

protocol Action { }

struct IncrementAction: Action { }
struct DecrementAction: Action { }
struct AddTaskAction: Action {
    let task: Task
}
struct GetMoviesAction: Action {
    let movies: [String]
}

struct AddAction: Action {
    let value: Int
}

class Store<StoreState: ReduxState>: ObservableObject {
    
    var reducer: Reducer<StoreState>
    @Published var  state: StoreState
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: Action) {
        state = reducer(state, action)
    }
    
}
