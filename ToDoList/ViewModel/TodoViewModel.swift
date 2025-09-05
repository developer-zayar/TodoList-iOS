//
//  TodoViewModel.swift
//  ToDoList
//
//  Created by Zay Yar Phyo on 05/09/2025.
//

import Foundation

@MainActor
class TodoViewModel: ObservableObject {
    @Published var todoList: [TodoItem] = []
    @Published var newTaskTitle: String = ""
    @Published var showExistingAlert = false

    @Published var todoStore = ToDoStore()

    init() {
        todoList = todoStore.loadTodoList()
    }

    func addNewTask() {
        let trimmedTitle = newTaskTitle.trimmingCharacters(in: .whitespacesAndNewlines)

        if todoList.contains(where: { $0.title == trimmedTitle }) {
            showExistingAlert = true
        } else {
            addTodo(title: trimmedTitle)
            newTaskTitle = ""
        }
    }

    func addTodo(title: String) {
        let newTodo = TodoItem(title: title)
        todoList.append(newTodo)
        todoStore.saveTodoList(todoList: todoList)
    }

    func toggleComplete(for todo: TodoItem) {
        if let index = todoList.firstIndex(where: { $0.id == todo.id }) {
            todoList[index].isCompleted.toggle()
            todoStore.saveTodoList(todoList: todoList)
        }
    }

    func deleteTodo(at todo: TodoItem) {
        if let index = todoList.firstIndex(where: { $0.id == todo.id }) {
            todoList.remove(at: index)
            todoStore.saveTodoList(todoList: todoList)
        }
    }
}
