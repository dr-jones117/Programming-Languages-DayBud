//
//  ToDoListViewModel.swift
//  DayBud
//
//  Created by Jonah Morgan on 11/1/23.
//

import Foundation

class ToDoListViewModel: ObservableObject {
    static let shared = ToDoListViewModel()
    @Published var tasksByDate: [Date: [TaskModel]] = [:]
    
    init() {
        print("Init todolistview")
        setupDefaultTasksForNextSixMonths(startingFrom: Date())
    }
    
    private func setupDefaultTasksForNextSixMonths(startingFrom date: Date) {
            let calendar = Calendar.current
            let startDate = calendar.startOfDay(for: date)

            for dayOffset in 0..<183 { // Approximately six months
                if let date = calendar.date(byAdding: .day, value: dayOffset, to: startDate) {
                    tasksByDate[date] = defaultTasksForDate(date)
                }
            }
        }
    
    private func defaultTasksForDate(_ date: Date) -> [TaskModel] {
        // Example default tasks
        let task1 = TaskModel(title: "Check emails", isCompleted: false, date: date)
        let task2 = TaskModel(title: "Daily standup meeting", isCompleted: false, date: date)
        let task3 = TaskModel(title: "Review project progress", isCompleted: false, date: date)

        return [task1, task2, task3]
    }
    
    func addTask(_ task: TaskModel, for date: Date){
        let startOfDay = Calendar.current.startOfDay(for: date)
        tasksByDate[startOfDay]?.append(task)
    }
    
    func tasksForDate(_ date: Date) -> [TaskModel] {
        let startOfDate = Calendar.current.startOfDay(for: date)
        return tasksByDate[startOfDate] ?? []
    }
    
    func deleteTask(date: Date, indexSet: IndexSet) {
        let startOfDay = Calendar.current.startOfDay(for: date)
        tasksByDate[startOfDay]?.remove(atOffsets: indexSet)
    }
    
    func moveTask(date: Date, form source: IndexSet, to destination: Int) {
        let startOfDay = Calendar.current.startOfDay(for: date)
        tasksByDate[startOfDay]?.move(fromOffsets: source, toOffset: destination)
    }
    
    func toggleTaskCompleted(_ task: TaskModel) {
        task.isCompleted.toggle()
    }
}
