import SwiftUI
import UIKit

struct DayView: View {
    @EnvironmentObject var dayViewModel: DayViewModel
    
    let backColor = Color(
        red: Double(0x13) / 255.0,
        green: Double(0x18) / 255.0,
        blue: Double(0x5A) / 255.0
    )
    
    init(){
        
    }
    
    var body: some View {
        VStack {
            Text("DayBud")
                .font(.largeTitle)
                .bold()
                .padding()

            DatePicker("Select a date", selection: $dayViewModel.date, in: ...Date(), displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
                .colorScheme(.dark)
            
            Spacer()
            
            NavigationLink(destination: ToDoListView().environmentObject(dayViewModel.toDoList)) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("To Do List For Today")
                        .font(.headline)
                    
                    // Display a preview of the to-do list items
                    ForEach(dayViewModel.toDoList.tasks.prefix(3)) { task in // Only show up to 3 tasks for preview
                        HStack {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .red)
                            Text(task.title)
                                .strikethrough(task.isCompleted)
                                .lineLimit(1)
                        }
                    }
                    
                    if dayViewModel.toDoList.tasks.count > 3 {
                        Text("...and more")
                            .font(.caption)
                    }
                }
                .padding()
                .frame(width: 300, height: 100)
                .background(Color(red: 0, green: 0, blue: 0.9))
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            .buttonStyle(PlainButtonStyle())
                        
            NavigationLink(destination: ContentView()) {
                HStack(spacing: 8) {
                    Text("Weather")
                        .font(.headline)
                    
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.orange).scaledToFill()
                }
                .padding()
                .frame(width: 300, height: 100) // Adjust height for more content
                .background(Color(red: 0, green: 0, blue: 0.9))
                .cornerRadius(10)
                .shadow(radius: 5)
                
            }
            .buttonStyle(PlainButtonStyle())
            .padding()
        }
        .background(backColor)
        .colorScheme(.dark)
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
