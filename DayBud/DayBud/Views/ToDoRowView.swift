//
//  ToDoRowView.swift
//  DayBud
//
//  Created by Jonah Morgan on 11/1/23.
//

import SwiftUI

struct ToDoRowView: View {
    
    @ObservedObject var task: TaskModel
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(task.isCompleted ? Color.green : Color.blue)
                .font(.title)
            Text(task.title)
            Spacer()
        }
        .padding(.vertical, 3)
    }
}

#Preview {
    Group {
        ToDoRowView(task: TaskModel(title: "Test", isCompleted: false))
        ToDoRowView(task: TaskModel(title: "Test 2", isCompleted: false))
        ToDoRowView(task: TaskModel(title: "Test 3", isCompleted: true))

    }
    .previewLayout(.sizeThatFits)
}
