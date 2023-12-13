import SwiftUI
import UIKit

struct DayView: View {
    @EnvironmentObject var dayViewModel: DayViewModel
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    @State private var updateTrigger = false
    let backColor = Color(
        red: Double(0x13) / 255.0,
        green: Double(0x18) / 255.0,
        blue: Double(0x5A) / 255.0
    )
    
    init(){
        
    }
    
    let weatherSummary = "Sunny, 23C"
    
    var body: some View {
        VStack {
            Text("DayBud")
                .font(.largeTitle)
                .bold()
                .padding()

            DatePicker("Select a date", selection: $dayViewModel.selectedDate, in: Date()..., displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
                .colorScheme(.dark)

            
            
            NavigationLink(destination: ToDoListView(selectedDate: $dayViewModel.selectedDate).environmentObject(dayViewModel.toDoList)) {
                       VStack(alignment: .leading, spacing: 4) {
                           
                           // Show the preview of the to-do list
                           ForEach(dayViewModel.currentDayTasks.prefix(3)) { task in
                               HStack {
                                   Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                       .foregroundColor(task.isCompleted ? .green : .red)
                                   Text(task.title)
                               }
                           }

                           if dayViewModel.currentDayTasks.count > 3 {
                               Text("...and more")
                                   .font(.caption)
                           }
                       }
                       .padding()
                       .frame(maxWidth: .infinity)
                       .background(Color.gray.opacity(0.1))
                       .cornerRadius(10)
                       .shadow(radius: 5)
                   }
                   .buttonStyle(PlainButtonStyle())
                   .padding()
                        
            // Weather button
            NavigationLink(destination: ContentView()) {
                HStack(spacing: 8) {
                    Text("\(dayViewModel.weatherInfo)")
                        .font(.headline)
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.orange).scaledToFill()
                    
                    
                }
                .padding()
                .frame(width: 300, height: 100)
                .background(Color(red: 0, green: 0, blue: 0.9))
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            .buttonStyle(PlainButtonStyle())
            .padding()
        }
        .background(backColor)
        .colorScheme(.dark)
        .onAppear{print("OnAppear"); dayViewModel.refreshTasks()}
    }
}

// Define a date formatter for displaying the date
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
}()


struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DayViewModel(date: Date(timeIntervalSinceReferenceDate: 0))
        
        NavigationView {
            DayView()
                .environmentObject(model)
        }
    }
}


