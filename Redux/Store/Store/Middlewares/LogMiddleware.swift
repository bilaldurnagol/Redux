//
//  LogMiddleware.swift
//  Redux
//
//  Created by Bilal Durnagöl on 8.04.2023.
//

import Foundation

func logMiddleware() -> Middleware<AppState> {
    
    return { state, action, dispatch in
        print("[LOG MIDDLEWARE]")
    }
}
