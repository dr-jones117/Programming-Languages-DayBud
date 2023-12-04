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
    
    let backColor = Color(
        red: Double(0x13) / 255.0,
        green: Double(0x18) / 255.0,
        blue: Double(0x4B) / 255.0
    )
    
    init(){
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("To Do List")
                .font(.largeTitle)
                .bold()
            
            List{
                ForEach(toDoListViewModel.tasks) { task in
                    ToDoRowView(task: task)
                        .onTapGesture {
                            toDoListViewModel.toggleTaskCompleted(task)
                        }.listRowBackground(backColor)
                }
                .onDelete(perform: toDoListViewModel.deleteTask)
                .onMove(perform: toDoListViewModel.moveTask)
            }
            .listStyle(PlainListStyle())
            
            HStack {
                TextField("Add a task", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
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
        .foregroundColor(Color.white)
        .navigationBarItems(trailing: EditButton())
        .padding()
        .background(backColor)
        .colorScheme(.dark)
    }
}

#Preview {
    NavigationView {
        ToDoListView()
    }
    .environmentObject(ToDoListViewModel())
}


