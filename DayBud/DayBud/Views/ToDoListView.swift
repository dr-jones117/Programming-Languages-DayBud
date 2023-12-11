//
//  ToDoListView.swift
//  DayBud
//
//  Created by Jonah Morgan on 11/1/23.
//

import SwiftUI

struct ToDoListView: View {
    @EnvironmentObject var dayViewModel: DayViewModel
    @EnvironmentObject var toDoListViewModel: ToDoListViewModel
    
    @Binding var selectedDate: Date
    
    @State var textFieldText: String = ""
    
    let backColor = Color(
        red: Double(0x13) / 255.0,
        green: Double(0x18) / 255.0,
        blue: Double(0x4B) / 255.0
    )
    
    init(selectedDate: Binding<Date>) {
        self._selectedDate = selectedDate
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("To Do List")
                .font(.largeTitle)
                .bold()
            
            List {
                ForEach(toDoListViewModel.tasksForDate(selectedDate) ) { task in
                    ToDoRowView(task: task)
                        .onTapGesture {
                            toDoListViewModel.toggleTaskCompleted(task)
                        }.listRowBackground(backColor)
                }
                .onDelete { offsets in
                    toDoListViewModel.deleteTask(date: selectedDate, indexSet: offsets)
                }
                .onMove { source, destination in
                    toDoListViewModel.moveTask(date: selectedDate, form: source, to: destination)
                }
            }
            .listStyle(PlainListStyle())
            
            HStack {
                TextField("Add a task", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .cornerRadius(10)
                
                Button(action: {
                    let taskDate = Calendar.current.startOfDay(for: selectedDate)
                    let newTask = TaskModel(title: textFieldText, isCompleted: false, date: taskDate)
                    toDoListViewModel.addTask(newTask, for: taskDate)
                }, label: {
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 60, height: 55)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            
            
        }
        .foregroundColor(Color.white)
        .navigationBarItems(trailing: EditButton())
        .padding()
        .background(backColor)
        .colorScheme(.dark)
        }
        
}

#Preview {
    NavigationView {
        //ToDoListView(Date())
    }
    .environmentObject(ToDoListViewModel())
}


