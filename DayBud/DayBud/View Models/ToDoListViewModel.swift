//
//  ToDoListViewModel.swift
//  DayBud
//
//  Created by Jonah Morgan on 11/1/23.
//

import Foundation

class ToDoListViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = []
    
    init() {
        initTasks()
    }
    
    func initTasks() {
        let newTasks = [
            TaskModel(title: "Task 1", isCompleted: false),
            TaskModel(title: "Task 2", isCompleted: true),
            TaskModel(title: "Task 3", isCompleted: false),
        ]
        tasks.append(contentsOf: newTasks)
    }
    
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func addTask(_ task: TaskModel){
        if(task.title == "") {
            return
        }
        tasks.append(task)
    }
    
    func toggleTaskCompleted(_ task: TaskModel) {
        task.isCompleted.toggle()
    }
}
