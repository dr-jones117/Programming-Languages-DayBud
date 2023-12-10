//
//  TaskModel.swift
//  DayBud
//
//  Created by Jonah Morgan on 11/1/23.
//

import Foundation

class TaskModel: Identifiable, ObservableObject, Codable {
    let id: String = UUID().uuidString
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}

