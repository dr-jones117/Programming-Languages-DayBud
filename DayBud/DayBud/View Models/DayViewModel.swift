import Foundation
import Combine
import CoreLocation

class DayViewModel: ObservableObject {
    @Published var selectedDate: Date {
        didSet {
            updateTasksForSelectedDates()
        }
    }
    @Published var currentDayTasks: [TaskModel] = []
    @Published var toDoList: ToDoListViewModel = ToDoListViewModel.shared
    @Published var quoteText: String = "\"You are what you eat...\""
    @Published var weatherInfo: String = "Weather Data"
    
    private var weatherManager = WeatherManager()
    
    init(date: Date) {
        self.selectedDate = date
    }
    
    private func updateTasksForSelectedDates() {
        currentDayTasks = toDoList.tasksForDate(selectedDate)
    }
    
    func refreshTasks() {
        self.currentDayTasks = toDoList.tasksForDate(selectedDate)
    }
}
