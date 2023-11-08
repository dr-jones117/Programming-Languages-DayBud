//
//  DayBudApp.swift
//  DayBud
//
//  Created by Jonah Morgan on 10/19/23.
//

import SwiftUI

@main
struct DayBudApp: App {
    
    @StateObject var toDoListViewModel: ToDoListViewModel = ToDoListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ToDoListView()
            }
            .environmentObject(toDoListViewModel)
        }
    }
}
