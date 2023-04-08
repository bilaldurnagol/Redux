//
//  ContentView.swift
//  Redux
//
//  Created by Bilal Durnagöl on 8.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @State private var isPresented: Bool = false
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        let counter: Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
        let onAdd: (Int) -> Void
    }
    
    private func map(state: CounterState) -> Props {
        Props(counter: state.counter, onIncrement: {
            store.dispatch(action: IncrementAction())
        }, onDecrement: {
            store.dispatch(action: DecrementAction())
        }, onAdd: {
            store.dispatch(action: AddAction(value: $0))
        })
    }
    
    // MARK: - BODY
    
    var body: some View {
        let props = map(state: store.state.counterState)
        
        VStack {
            Text("\(props.counter)")
                .padding()
            
            Button("Increment") {
                props.onIncrement()
            }
            
            Button("Decrement") {
                props.onDecrement()
            }
            
            Button("Add") {
                props.onAdd(100)
            }
            
            Spacer()
            
            Button("Add Task") {
                isPresented = true
            }
            
            Spacer()
        }
        .sheet(isPresented: $isPresented) {
            AddTaskView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: appReducer, state: AppState())
        ContentView()
            .environmentObject(store)
        
    }
}
