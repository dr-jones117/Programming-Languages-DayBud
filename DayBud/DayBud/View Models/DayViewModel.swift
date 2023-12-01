import Foundation
import Combine

class DayViewModel: ObservableObject {
    @Published var date: Date
    @Published var quoteText: String = "\"You are what you eat...\""
    @Published var toDoList = ToDoListViewModel()
    @Published var weatherInfo: String = "Weather App Goes Below"
    
    
    
    init(date: Date) {
        self.date = date
        self.toDoList = ToDoListViewModel()
    }
    
}
