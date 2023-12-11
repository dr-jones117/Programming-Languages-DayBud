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
    var date: Date
    
    init(title: String, isCompleted: Bool, date: Date) {
        self.title = title
        self.isCompleted = isCompleted
        self.date = date
    }
}

