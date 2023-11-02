//
//  ToDoListView.swift
//  DayBud
//
//  Created by Jonah Morgan on 11/1/23.
//

import SwiftUI

struct ToDoListView: View {
    
    @EnvironmentObject var toDoListViewModel: ToDoListViewModel
    
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack {
            List{
                ForEach(toDoListViewModel.tasks) { task in
                    ToDoRowView(task: task)
                        .onTapGesture {
                            toDoListViewModel.toggleTaskCompleted(task)
                        }
                }
                .onDelete(perform: toDoListViewModel.deleteTask)
                .onMove(perform: toDoListViewModel.moveTask)
            }
            .listStyle(PlainListStyle())
            
            HStack {
                TextField("Add a task", text: $textFieldText, onCommit: {
                    toDoListViewModel.addTask(TaskModel(title: textFieldText, isCompleted: false))
                    textFieldText = ""
                })
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                    .cornerRadius(10)
                
                Button(action: {
                    toDoListViewModel.addTask(TaskModel(title: textFieldText, isCompleted: false))
                    textFieldText = ""
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
        .navigationTitle("To Do List ✍🏻")
        .navigationBarItems(leading: EditButton())
        .padding()
    }
}

#Preview {
    NavigationView {
        ToDoListView()
    }
    .environmentObject(ToDoListViewModel())
}


