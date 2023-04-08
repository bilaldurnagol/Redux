//
//  IncrementMiddleware.swift
//  Redux
//
//  Created by Bilal Durnagöl on 8.04.2023.
//

import Foundation

func incrementMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        
        switch action {
        case _ as IncrementActionAsyc:
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                dispatch(IncrementAction())
            }
        default:
            break
        }
    }
}
