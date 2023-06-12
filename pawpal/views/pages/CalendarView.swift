//
//  CalendarView.swift
//  pawpal
//
//  Created by Aqilla Julia Chandra on 11/06/23.
//

import SwiftUI

struct CalendarDay: Identifiable {
    let id = UUID()
    let day: Int
    var hasEvent: Bool = false
}

struct CalendarMonth: Identifiable {
    let id = UUID()
    let month: String
    let year: String
    let days: [CalendarDay]
}

struct CalendarTestView: View {
    private let calendar = Calendar.current
    private let dateFormatter = DateFormatter()
    
    private var currentYear: Int {
        calendar.component(.year, from: Date())
    }

    private var allMonths: [CalendarMonth] {
        (1...12).compactMap {
            let monthName = dateFormatter.monthSymbols[$0 - 1]
            let days = generateCalendarDays(for: $0, year: currentYear)
            return CalendarMonth(month: monthName, year: String(currentYear), days: days)
        }
    }
    
    private func generateCalendarDays(for month: Int, year: Int) -> [CalendarDay] {
        let startDateComponents = DateComponents(year: year, month: month, day: 1)
        let startDate = calendar.date(from: startDateComponents)!
        let totalDaysInMonth = calendar.range(of: .day, in: .month, for: startDate)!.count
        let weekdayComponent = calendar.component(.weekday, from: startDate)
        let firstDayOffset = (weekdayComponent + 6) % 7
        
        var days: [CalendarDay] = []
        for day in 1...totalDaysInMonth {
            let calendarDay = CalendarDay(day: day)
            days.append(calendarDay)
        }
        for _ in 0..<firstDayOffset {
            days.insert(CalendarDay(day: 0), at: 0)
        }
        return days
    }
    
    func convertDaysToBahasa(_ Day: String) -> String{
        if Day == "Su"{
            return "M"
        }else if Day == "Mo"{
            return "S"
        }else if Day == "Tu"{
            return "S"
        }else if Day == "We"{
            return "R"
        }else if  Day == "Th"{
            return "K"
        }else if Day == "Fr"{
            return "J"
        }else {
            return "S"
        }
    }
    
    func convertMonthToBahasa(_ Month: String) -> String{
        if Month == "January"{
            return "Januari"
        }else if Month == "February"{
            return "Februari"
        }else if Month == "March"{
            return "Maret"
        }else if Month == "April"{
            return "April"
        }else if Month == "May"{
            return "Mei"
        }else if Month == "June"{
            return "Juni"
        }else if Month == "July"{
            return "Juli"
        }else if Month == "August"{
            return "Agustus"
        }else if Month == "September"{
            return "September"
        }else if Month == "October"{
            return "Oktober"
        }else if Month == "November"{
            return "November"
        }
        else{
            return "Desember"
        }
    }
    
    var body: some View {
        VStack{
            Spacer()
            HStack (spacing: 45.0){
                ForEach(dateFormatter.shortWeekdaySymbols, id: \.self) { weekday in
                    Text(convertDaysToBahasa(String(weekday.prefix(2))))
                        .multilineTextAlignment(.center)
                        .font(.custom("", size: 13))
                        .fontWeight(.medium)
                        .foregroundColor(Color("neutral400"))
                        .fontDesign(.rounded)
                }
            }
            ScrollView(.vertical, showsIndicators: true){
               
                VStack {
                    ForEach(allMonths) { month in
                        VStack {
                            Text("\(convertMonthToBahasa(month.month)) \(month.year)")
                                .multilineTextAlignment(.leading)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("neutral800"))
                                .fontDesign(.rounded)
                                .padding(.bottom)

                            
                            LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 10) {
                                ForEach(month.days) { day in
                                    if day.day == 0 {
                                        Text(" ")
                                    } else {
                                        Text("\(day.day)")
                                            .multilineTextAlignment(.leading)
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color("Green800"))
                                            .fontDesign(.rounded)
                                            .frame(width: 40, height: 40)
                                            .background(day.hasEvent ? Color.red : Color.clear)
                                            .foregroundColor(day.hasEvent ? .white : .primary)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle()
                                                    .stroke(Color("green200"), lineWidth: 1)
                                            )

                                        
                                        
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        .padding(.vertical)
                    }
                }
            }
        }
        
    
    }
}

struct CalendarView: View {
    var body: some View {
        CalendarTestView()
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
