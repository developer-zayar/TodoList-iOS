//
//  ToDoStore.swift
//  ToDoList
//
//  Created by Zay Yar Phyo on 02/08/2025.
//

import Foundation

class ToDoStore {
    private let userDefaults = UserDefaults.standard
    private let todoListKey = "saved_todo_list"

    func saveTodoList(todoList: [TodoItem]) {
        if let encoded = try? JSONEncoder().encode(todoList) {
            userDefaults.set(encoded, forKey: todoListKey)
        }
    }

    func loadTodoList() -> [TodoItem] {
        if let data = userDefaults.data(forKey: todoListKey) {
            if let decoded = try? JSONDecoder().decode([TodoItem].self, from: data) {
                return decoded
            }
        }
        return []
    }
}
