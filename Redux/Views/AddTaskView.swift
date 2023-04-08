//
//  AddTaskView.swift
//  Redux
//
//  Created by Bilal Durnagöl on 8.04.2023.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var name: String = ""
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        // props
        let tasks: [Task]
        // dispatch
        let onTaskAdded: (Task) -> Void
    }
    
    private func map(state: TaskState) -> Props {
        return Props(tasks: state.tasks, onTaskAdded: { task in
            store.dispatch(action: AddTaskAction(task: task))
        })
    }
    
    var body: some View {
        
        let props = map(state: store.state.tastState)
        
        VStack(spacing: 20) {
            TextField("Enter Task", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Add") {
                let task = Task(title: name)
                props.onTaskAdded(task)
            }
            .buttonStyle(.borderedProminent)
            List(props.tasks, id: \.id) { task in
                Text(task.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
            }
            Spacer()
        }
        .padding()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: appReducer, state: AppState())
        AddTaskView()
            .environmentObject(store)
    }
}
