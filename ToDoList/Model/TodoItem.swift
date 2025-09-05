//
//  TodoItem.swift
//  ToDoList
//
//  Created by Zay Yar Phyo on 02/08/2025.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false

    init(title: String) {
        self.title = title
    }
}
