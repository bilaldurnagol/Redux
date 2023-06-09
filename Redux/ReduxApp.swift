//
//  ReduxApp.swift
//  Redux
//
//  Created by Bilal Durnagöl on 8.04.2023.
//

import SwiftUI

@main
struct ReduxApp: App {
    var body: some Scene {
        
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [logMiddleware(), incrementMiddleware()])
        
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
