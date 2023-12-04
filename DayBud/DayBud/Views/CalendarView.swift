//
//  CalendarView.swift
//  DayBud
//
//  Created by Jonah Morgan on 12/4/23.
//
import SwiftUI

struct CalendarView: View {
    private let daysInWeek = 7
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        VStack {
            Text("Calendar")
                .font(.title2)
                .foregroundStyle(Color.white)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(1...30, id: \.self) { day in
                        CalendarDayView(day: day)
                            .frame(width: 40, height: 40)
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

struct CalendarDayView: View {
    var day: Int
    
    var body: some View {
        Text("\(day)")
            .font(.body)
            .foregroundStyle(Color.white)
            .frame(width: 30, height: 30)
            .background(Color(.blue).opacity(0.2))
            .cornerRadius(15)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CalendarView()
        }
    }
}
