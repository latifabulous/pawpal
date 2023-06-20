//
//  LogView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 10/06/23.
//

import SwiftUI

struct LogView: View {
    //    @State private var dragOffset: CGSize = .zero
    
    @EnvironmentObject var modelView: ModelView
    
    @ObservedObject var logModel: LogViewModel = LogViewModel()
    
    @Environment(\.editMode) var editButton
    @Environment(\.managedObjectContext) private var context
    
    var body: some View {
        // select date, week
        ZStack {
            Image("bg-green")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                    Section {
                        
                        // week view
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 12){
                                
                                Button(action: {
                                            // Menggeser ke minggu sebelumnya
                                            let previousWeek = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: logModel.currentWeek.first!)
                                            logModel.currentWeek = logModel.fetchWeekDates(startingFrom: previousWeek ?? Date())
                                        }) {
                                            Image(systemName: "chevron.left")
                                                .foregroundColor(.black)
                                        }
                                
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
                                
                                Button(action: {
                                    // Menggeser ke minggu setelahnya
                                    let nextWeek = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: logModel.currentWeek.first!)
                                    logModel.currentWeek = logModel.fetchWeekDates(startingFrom: nextWeek ?? Date())
                                }) {
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                }
                                
                            }
                            .padding(.top, 16)
//                            .padding(.bottom, 24)

                        }
                        .background(Color("neutral10"))
                        
                        
                        LogsView()
                        
                    } header: {
                        HeaderView()
                    }
                }
            }
            .ignoresSafeArea(.container, edges: .top)
        }
        
        
        // add button
//        .overlay(
//            Button(action: {
//                logModel.addNewLog.toggle()
//            }, label: {
//                Image(systemName: "plus")
//                    .foregroundColor(Color("neutral10"))
//                    .padding()
//                    .background(Color("orange600"), in: Circle())
//            })
//            .padding()
//            , alignment: .bottom
//        )
//        .sheet(isPresented: $logModel.addNewLog){
//            NewLogDummyView()
//        }
        
        .sheet(isPresented: $logModel.addNewLog) {
            // clearing edit data
            logModel.editLog = nil
        } content: {
            NewLogDummyView()
                .environmentObject(logModel)
        }
    }
    
    // log view untuk masing masing hari
    func LogsView() -> some View {
        LazyVStack(spacing: 0) {
            
            // converting object as log model
            DynamicFilteredView(dateToFilter: logModel.currentDay) { (object: PawLog) in
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
    
    
    func LogCardView(log: PawLog) -> some View {
        
        HStack(alignment: editButton?.wrappedValue == .active ? .center : .top, spacing: 16) {
            
            if editButton?.wrappedValue == .active {
                Button {
                    // delete data
                    context.delete(log)
                    
                    // save
                    try? context.save()
                    
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.red)
                }
            } else {
                // view for each log
                VStack(spacing: 0) {
                    Circle()
                        .fill(Color("green800"))
                        .frame(width: 12, height: 12)

                    Rectangle()
                        .fill(Color("green800"))
                        .frame(width: 1.5)
                }
            }
            
            
            VStack(alignment: .leading, spacing: 16) {
                
                HStack(alignment: .center, spacing: 16) {
                    Text(log.logDate?.formatted(date: .omitted, time: .shortened) ?? "")
                        .font(.callout)
                        .fontWeight(.regular)
                        .fontDesign(.rounded)
                    
                    Button {
                        logModel.editLog = log
                        logModel.addNewLog.toggle()
                    } label: {
                        HStack(alignment: .center) {
                            Image(systemName: "pencil")
                                .foregroundColor(Color("orange600"))
                                
                            
                            Text("Tambah Catatan")
                                .font(.callout)
                                .fontWeight(.regular)
                                .fontDesign(.rounded)
                                
                                .foregroundColor(Color("orange600"))
                                
                        }
                        .frame(width: 108)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 99)
                                .stroke(Color("neutral200"), lineWidth: 1)
                        )
                        
                    }
                }
                VStack (alignment: .leading, spacing: 16){
                    Text(log.catKebutuhan ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        Divider()
                            .padding(.bottom, 24)
                    
                    Image(log.catImage ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 280)
                    

                    
                    HStack(alignment: .center, spacing: 16){
                        Image("pupil")
                            
                            .frame(width:56, height: 56)
                            .background(
                                Circle()
                                    .fill(Color("orange200"))
                            )
                        Text(log.catPupil ?? "")
                            .font(.body)
                            .fontWeight(.medium)
                            .fontDesign(.rounded)
                            .foregroundColor(Color("neutral800"))
                    }
                    HStack(alignment: .center, spacing: 16){
                        Image("telinga")
                            
                            .frame(width:56, height: 56)
                            .background(
                                Circle()
                                    .fill(Color("orange200"))
                            )
                        Text(log.catTelinga ?? "")
                            .font(.body)
                            .fontWeight(.medium)
                            .fontDesign(.rounded)
                            .foregroundColor(Color("neutral800"))
                    }
                    HStack(alignment: .center, spacing: 16){
                        Image("suara")
                            
                            .frame(width:56, height: 56)
                            .background(
                                Circle()
                                    .fill(Color("orange200"))
                            )
                        Text(log.catSuara ?? "")
                            .font(.body)
                            .fontWeight(.medium)
                            .fontDesign(.rounded)
                            .foregroundColor(Color("neutral800"))
                    }

                    
                    HStack(alignment: .center, spacing: 16){
                        Image("ekor")
                            
                            .frame(width:56, height: 56)
                            .background(
                                Circle()
                                    .fill(Color("orange200"))
                            )
                        Text(log.catEkor ?? "")
                            .font(.body)
                            .fontWeight(.medium)
                            .fontDesign(.rounded)
                            .foregroundColor(Color("neutral800"))
                    }
                    HStack(alignment: .center, spacing: 16){
                        Image("badan")
                            
                            .frame(width:56, height: 56)
                            .background(
                                Circle()
                                    .fill(Color("orange200"))
                            )
                        Text(log.catBadan ?? "")
                            .font(.body)
                            .fontWeight(.medium)
                            .fontDesign(.rounded)
                            .foregroundColor(Color("neutral800"))
                    }
                   
                    Text("Note")
                        .font(.title3)
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
//                        Divider()
//                        .padding(.bottom, 24)
                    
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(log.logNote ?? "")
                            .font(.body)
                            .fontWeight(.medium)
                            .fontDesign(.rounded)
                            .foregroundColor(Color("neutral800"))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity)
//                            .multilineTextAlignment(.center)
                        
                            
                    }
                    .background(RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("orange200")))
//                    .padding(.horizontal, 24)
                    .padding(.bottom, 80)
                    .cornerRadius(20)
                    
                    
                    
//                    Text(log.logNote ?? "")
//                        .fontWeight(.medium)
//                        .fontDesign(.rounded)
//                        .foregroundColor(Color("neutral800"))
//                        .padding(.bottom, 80)
                    
                }
                
            }
//            .padding(.horizontal)s
        }
        .hLeading()
    }
    
    // header
    func HeaderView() -> some View {
        HStack(alignment: .center, spacing: 24) {
            
            Text("PawLog")
                .font(.largeTitle.bold())
                .fontDesign(.rounded)
            
        
            .hLeading()
            
            EditButton()
            
 
        }
        .padding(24)
        .padding(.top, getSafeArea().top)
        .background(Color("neutral10"))
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
