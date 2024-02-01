//
//  AddTodoView.swift
//  Todo
//
//  Created by Mammad Mammadli on 02.02.24.
//

import SwiftUI

struct AddTodoView: View {
    @Binding var todo: Todo
    var onAdd: (String) -> Void
    @State private var newTodo = ""
    @Environment(\.dismiss) var dismiss
    
    func handleAdd() {
        onAdd(newTodo)
        dismiss()
    }
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                TextField("New todo", text: $newTodo)
                    .padding()
                Spacer()
                HStack {
                    Spacer()
                    Button(action: handleAdd) {
                        Text("Add")
                            .frame(width: 100, height: 24)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }.frame(
                minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                maxWidth: UIScreen.main.bounds.width,
                minHeight: 0,
                maxHeight: UIScreen.main.bounds.height / 2,
                alignment: .topLeading
            )
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }.presentationDetents([.height(200), .medium])
    }
}



struct AddTodoViewPreview: PreviewProvider {

    static var previews: some View {
        let todo = Todo()
        AddTodoView(todo: .constant(todo), onAdd: {_ in})
    }
}
