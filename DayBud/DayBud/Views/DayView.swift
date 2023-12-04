import SwiftUI
import UIKit

struct DayView: View {
    @EnvironmentObject var dayViewModel: DayViewModel
    
    init(){
        
    }
    
    var body: some View {
        VStack {
            Text("\(dayViewModel.date, formatter: dateFormatter)").font(.largeTitle)

                .foregroundStyle(Color.white)
            
            Spacer()
            
            CalendarView()
            
            Spacer()
            
            NavigationLink(destination: ToDoListView().environmentObject(dayViewModel.toDoList)) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("To Do List For Today")
                        .font(.headline)
                        .foregroundColor(Color.white)
                    
                    // Display a preview of the to-do list items
                    ForEach(dayViewModel.toDoList.tasks.prefix(3)) { task in // Only show up to 3 tasks for preview
                        HStack {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .red)
                            Text(task.title)
                                .strikethrough(task.isCompleted)
                                .foregroundStyle(Color.white)
                                .lineLimit(1)
                        }
                    }
                    
                    if dayViewModel.toDoList.tasks.count > 3 {
                        Text("...and more")
                            .font(.caption)
                            .foregroundStyle(Color.white)
                    }
                }
                .padding()
                .frame(width: 300, height: 100)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            .buttonStyle(PlainButtonStyle())
            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
            
                        
            NavigationLink(destination: ContentView()) {
                HStack(spacing: 8) {
                    Text("Weather")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                    
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.orange).scaledToFill()
                }
                .padding()
                .frame(width: 300, height: 100) // Adjust height for more content
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 5)
                
            }
            .buttonStyle(PlainButtonStyle())
            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
            .padding(20)
        }
        .background(Color.blue)
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
