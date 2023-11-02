//
//  TaskModel.swift
//  DayBud
//
//  Created by Jonah Morgan on 11/1/23.
//

import Foundation

class TaskModel: Identifiable, ObservableObject {
    let id: String = UUID().uuidString
    var title: String
    @Published var isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}

