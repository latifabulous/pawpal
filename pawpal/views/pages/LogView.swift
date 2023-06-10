//
//  LogView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 10/06/23.
//

import SwiftUI

struct LogView: View {
    @ObservedObject var logModel: LogViewModel = LogViewModel()
//    @State private var dragOffset: CGSize = .zero
    
    var body: some View {
        // select date, week
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16, pinnedViews: [.sectionHeaders]) {
                Section {
                    
                    // week view
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 12){
                            
//                            Button(action: {
//                                        // Menggeser ke minggu sebelumnya
//                                        let previousWeek = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: logModel.currentWeek.first!)
//                                        logModel.currentWeek = logModel.fetchWeekDates(startingFrom: previousWeek ?? Date())
//                                    }) {
//                                        Image(systemName: "chevron.left")
//                                            .foregroundColor(.black)
//                                    }
                            
                            ForEach(logModel.currentWeek, id: \.self) {
                                day in
                                
                                VStack(spacing: 12) {
                                    // EEE = sen sel
                                    Text(logModel.extractDate(date: day, format: "EEE"))
                                        .font(.footnote)
                                        .fontWeight(.medium)
                                        .foregroundColor(Color("neutral400"))
                                    Text(logModel.extractDate(date: day, format: "dd"))
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("neutral10"))
                                        .frame(width: 40, height: 40)
                                        .background(
                                            ZStack{
                                                Capsule()
                                                    .fill(Color("green800"))
                                            }
                                        )
                                        .onTapGesture {
                                            // updating current day
                                            
//                                            logModel.currentDay = day
                                            
                                            withAnimation{
                                                logModel.currentDay = day
                                            }
                                        }
                                    
                                    LineShape()
                                        .stroke(Color("green800"), lineWidth: 2)
                                        .opacity(logModel.istoday(date: day) ? 1 : 0)
                                }
                            }
                            
//                            Button(action: {
//                                // Menggeser ke minggu setelahnya
//                                let nextWeek = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: logModel.currentWeek.first!)
//                                logModel.currentWeek = logModel.fetchWeekDates(startingFrom: nextWeek ?? Date())
//                            }) {
//                                Image(systemName: "chevron.right")
//                                    .foregroundColor(.black)
//                            }
                            
                        }
                        .padding(24)
//                        .offset(x: dragOffset.width, y: dragOffset.height)
//                        .gesture(
//                            DragGesture()
//                                .onChanged { value in
//                                    dragOffset = value.translation
//                                }
//                                .onEnded { value in
//                                    dragOffset = .zero
//                                    if value.translation.width > 100 {
//                                        // Swipe ke kanan berhasil
//                                        let nextWeek = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: logModel.currentWeek.first!)
//                                        logModel.currentWeek = logModel.fetchWeekDates(startingFrom: nextWeek ?? Date())
//                                    } else if value.translation.width < -100 {
//                                        // Swipe ke kiri berhasil
//                                        let previousWeek = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: logModel.currentWeek.first!)
//                                        logModel.currentWeek = logModel.fetchWeekDates(startingFrom: previousWeek ?? Date())
//                                    }
//                                }
//                        )
                    }
                    
                    
                    LogsView()
                    
                } header: {
                    HeaderView()
                }
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        
        // add button
        .overlay(
            Button(action: {
                
            }, label: {
                Image(systemName: "plus")
                    .foregroundColor(Color("neutral10"))
                    .padding()
                    .background(Color("orange600"), in: Circle())
            })
            .padding()
            , alignment: .bottom
        )
    }
    
    // log view untuk masing masing hari
    func LogsView() -> some View {
        LazyVStack(spacing: 0) {
            
            // converting object as log model
            DynamicFilteredView(dateToFilter: logModel.currentDay) { (object: Log) in
                LogCardView(log: object)
            }
            
//            if let logs = logModel.filteredLogs {
//                if logs.isEmpty {
//                    Text("kosong")
//                } else {
//                    ForEach(logs) { log in
//                        LogCardView(log: log)
//                    }
//                }
//            } else {
//                ProgressView()
//                    .offset(y: 100)
//            }
        }
        .padding(24)
        
//        // update log
//        .onChange(of: logModel.currentDay){ newValue in
//            logModel.filterTodayLog()
//
//        }
    }
    
    func LogCardView(log: Log) -> some View {
        
        HStack {
            // view for each log
            VStack(spacing: 0) {
                Circle()
                    .fill(Color("green800"))
                    .frame(width: 12, height: 12)
                
                Rectangle()
                    .fill(Color("green800"))
                    .frame(width: 1.5)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text(log.logDate?.formatted(date: .omitted, time: .shortened) ?? "")
                Text(log.catDeskripsi ?? "")
                Text(log.catPupil ?? "")
                Text(log.catTelinga ?? "")
                Text(log.catSuara ?? "")
                Text(log.catEkor ?? "")
                Text(log.catBadan ?? "")
                Text(log.catKebutuhan ?? "")
                Text(log.logNote ?? "")
                    .padding(.bottom, 80)
            }
            .padding(.horizontal)
        }
        .hLeading()
    }
    
    // header
    func HeaderView() -> some View {
        HStack(alignment: .center, spacing: 24) {
            Button {
                
            } label: {
                Image("cat-profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("apa")
                Text("Today")
                    .font(.largeTitle.bold())
            }
            .hLeading()
            
 
        }
        .padding(24)
        .padding(.top, getSafeArea().top)
        .background(Color("neutral10"))
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
