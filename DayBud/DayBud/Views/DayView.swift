import SwiftUI

struct DayView: View {
    @EnvironmentObject var dayViewModel: DayViewModel
    
    init(){
        
    }
    
    var body: some View {
        VStack {
            Text("Date: \(dayViewModel.date, formatter: dateFormatter)")
            
            NavigationLink(destination: ToDoListView().environmentObject(dayViewModel.toDoList)) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("TO-DO List Preview")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    // Display a preview of the to-do list items
                    ForEach(dayViewModel.toDoList.tasks.prefix(3)) { task in // Only show up to 3 tasks for preview
                        HStack {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .red)
                            Text(task.title)
                                .strikethrough(task.isCompleted)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                    }
                    
                    if dayViewModel.toDoList.tasks.count > 3 {
                        Text("...and more")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
                .frame(width: 300, height: 100)
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            .buttonStyle(PlainButtonStyle())
            
            
            NavigationLink(destination: ContentView()) {
                HStack(spacing: 8) {
                    Text("Weather App")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.orange).scaledToFill()
                }
                .padding()
                .frame(width: 300, height: 100) // Adjust height for more content
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .shadow(radius: 5)
                
            }
            .buttonStyle(PlainButtonStyle())
        }
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
        DayView()
    }
}