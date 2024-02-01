//
//  TodoListView.swift
//  Todo
//
//  Created by Mammad Mammadli on 02.02.24.
//

import SwiftUI

struct TodoStruct {
    var id = UUID()
    var text: String
}

@Observable
class Todo {
    var todos: [TodoStruct] = []
    
    func addTodo (todoName: String) {
        todos.append(TodoStruct(text: todoName))
    }
}

struct TodoListView: View {
    @State private var todo = Todo()
    @State private var showAddSheet = false
    
    func handleAdd() -> Void {
        showAddSheet.toggle()
    }
    
    var body: some View {
        NavigationStack {
            if todo.todos.count == 0 {
                HStack (alignment: .top) {
                    Text("You have nothing todo")
                    Spacer()
                }.padding()
            }
            List(todo.todos, id: \.id) { todo in
                HStack {
                    Text(todo.text)
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                Button(action: handleAdd) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Add new todo")
            }
        }.sheet(isPresented: $showAddSheet, content: {
            AddTodoView(todo: $todo, onAdd: { newTodo in
                todo.addTodo(todoName: newTodo)
            })
        })
    }
}

#Preview {
    TodoListView()
}
