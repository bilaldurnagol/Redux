//
//  TaskReducer.swift
//  Redux
//
//  Created by Bilal Durnagöl on 8.04.2023.
//

import Foundation

func taskReducer(_ state: TaskState, _ action: Action) -> TaskState {
    
    var state = state
    
    switch action {
    case let action as AddTaskAction:
        state.tasks.append(action.task)
    default:
        break
    }
    
    return state
}
