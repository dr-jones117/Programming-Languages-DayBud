//
//  ToDoRowView.swift
//  DayBud
//
//  Created by Jonah Morgan on 11/1/23.
//

import SwiftUI

struct ToDoRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    ToDoRowView(title: "First task!!!")
}
