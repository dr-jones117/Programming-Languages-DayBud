//
//  DayBudApp.swift
//  DayBud
//
//  Created by Jonah Morgan on 10/19/23.
//

import SwiftUI

@main
struct DayBudApp: App {
    @StateObject private var store = TaskStore()
    @Environment(\.scenePhase) private var scenePhase
    
    @StateObject var dayViewModel: DayViewModel = {
            let components = DateComponents(year: 1998, month: 10, day: 2)
            let customDate = Calendar.current.date(from: components)!
            return DayViewModel(date: customDate)
        }()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                DayView().environmentObject(dayViewModel)
                    .task {
                        do {
                            try await store.load()
                        } catch {
                            fatalError(error.localizedDescription)
                        }
                    }.onChange(of: scenePhase) { phase in
                        Task{
                            if phase == .inactive {
                                do {
                                    try await store.save(tasks: store.tasks)
                                } catch {
                                    fatalError(error.localizedDescription)
                                }
                            }
                        }
                    }
            }
        }
    }
}
