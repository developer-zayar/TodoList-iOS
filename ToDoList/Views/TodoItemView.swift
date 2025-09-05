//
//  TodoItemView.swift
//  ToDoList
//
//  Created by Zay Yar Phyo on 02/08/2025.
//

import SwiftUI

struct TodoItemView: View {
    let item: TodoItem
    let onToggle: () -> Void

    var body: some View {
        HStack {
            Button(action: onToggle) {
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(item.isCompleted ? .green : .gray)
            }
            .buttonStyle(.plain)

            Text(item.title)
                .strikethrough(item.isCompleted)
                .foregroundStyle(item.isCompleted ? .gray : .primary)

            Spacer()
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    TodoItemView(item: TodoItem(title: "Task 1")) {}
}
