//
//  ToDoListView.swift
//  DayBud
//
//  Created by Jonah Morgan on 11/1/23.
//

import SwiftUI

struct ToDoListView: View {
    
    @State var tasks: [String] = [
        "Task 1",
        "Task 2",
        "Task 3"
    ]
    
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack {
            List{
                ForEach(tasks, id: \.self) { task in
                    ToDoRowView(title: task)
                }
            }
            .listStyle(PlainListStyle())
            
            HStack {
                TextField("Add a task", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                    .cornerRadius(10)
                
                Button(action: {
                    
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
        .padding()
    }
}

#Preview {
    NavigationView {
        ToDoListView()
    }
}


