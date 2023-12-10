//
//  TaskStore.swift
//  DayBud
//
//  Created by Tate on 12/8/23.
//
import SwiftUI

@MainActor
class TaskStore: ObservableObject {
    @Published var tasks: [TaskModel] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("task.data")
    }
    
    func load() async throws {
        let task = Task<[TaskModel], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let dailyTasks = try JSONDecoder().decode([TaskModel].self, from: data)
            return dailyTasks
        }
        let tasks = try await task.value
        self.tasks = tasks
    }
    
    func save(tasks: [TaskModel]) async throws {
        let task = Task{
            let data = try JSONEncoder().encode(tasks)
            let outfile = try Self.fileURL()
            try data.write(to:outfile)
        }
        _ = try await task.value
    }
}
