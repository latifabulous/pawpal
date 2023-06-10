//
//  LogViewModel.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 10/06/23.
//

import SwiftUI

class LogViewModel: ObservableObject {
//    @Published var storedLog: [LogModel] = [
//        LogModel(logDate: Date(), logNote: "apa", pupil: "Normal", telinga: "Tegal", suara: "Mendesis", ekor: "Terangkat tinggi dan gemetar", posisi_badan: "Berdiri Tegak", kebutuhan: "Marah", deskripsi: "Kucingmu marah cok"
//        ),
//        LogModel(logDate: .init(timeIntervalSince1970: currentTimeInterval), logNote: "apa", pupil: "Normal", telinga: "Tegal", suara: "Mendesis", ekor: "Terangkat tinggi dan gemetar", posisi_badan: "Berdiri Tegak", kebutuhan: "Marah", deskripsi: "Kucingmu marah babi"
//        )
//
//    ]
    
    // fetch current week days
    @Published var currentWeek: [Date] = []
    
    // current date
    @Published var currentDay: Date = Date()
//    {
//        didSet {
//            filterTodayLog()
//        }
//    }
    
    // filter log untuk masing masing hari
    @Published var filteredLogs: [LogModel]? = []
    
    
    
    // initializing
    init() {
        fetchCurrentWeek()
//        filterTodayLog()
    }

//    func filterTodayLog() {
//        DispatchQueue.global(qos: .userInteractive).async {
//            let calendar = Calendar.current
//            let filtered = self.storedLog.filter { log in
////                return calendar.isDate(log.logDate, inSameDayAs: Date())
//
//                return calendar.isDate(log.logDate, inSameDayAs: self.currentDay)
//            }
//
////            self.filteredLogs = filtered
//
//            DispatchQueue.main.async {
//                withAnimation(){
//                    self.filteredLogs = filtered
//                }
//            }
//        }
//    }
    
    func fetchCurrentWeek() {
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (1...7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
    
    func fetchWeekDates(startingFrom startDate: Date) -> [Date] {
        let calendar = Calendar.current
        
        var dates: [Date] = []
        var currentDate = startDate
        
        // mengambil tanggal untuk setiap hari dalam seminggu
        for _ in 1...7 {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return dates
    }

    
    // extracting date
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "id_ID")
        formatter.amSymbol = "WIB" 
        formatter.pmSymbol = "WIB"
        
        return formatter.string(from: date)
    }
    
    // check if current day is today
    func istoday(date: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
}


