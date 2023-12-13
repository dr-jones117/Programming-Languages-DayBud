//
//  DayBudApp.swift
//  DayBud
//
//  Created by Jonah Morgan on 10/19/23.
//

import SwiftUI

@main
struct DayBudApp: App {
    @StateObject var dayViewModel: DayViewModel = {
            return DayViewModel(date: Date())
        }()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                DayView().environmentObject(dayViewModel).environmentObject(ToDoListViewModel.shared)
            }
        }
    }
}
