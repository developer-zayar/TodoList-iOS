//
//  ContentView.swift
//  ToDoList
//
//  Created by Zay Yar Phyo on 02/08/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TodoViewModel()

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.todoList) { item in
                        TodoItemView(item: item) {
                            viewModel.toggleComplete(for: item)
                        }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                viewModel.deleteTodo(at: item)
                            }
                        }
                    }
                }

                HStack {
                    TextField("Add new task", text: $viewModel.newTaskTitle)
                    Button("Add") {
                        viewModel.addNewTask()
                    }
                    .disabled(viewModel.newTaskTitle.isEmpty)
                }
                .padding()
            }
            .navigationTitle("ToDo List")
            .alert("Duplicate Title", isPresented: $viewModel.showExistingAlert) {
//                Button("OK", role: .destructive) {}
            } message: {
                Text("The note with this title already exists.")
            }
        }
    }
}

#Preview {
    ContentView()
}
