//
//  CobaEntryIndikator.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 19/08/23.
//


//import SwiftUI
//import CoreML
//
//struct DismissButton: View {
//    @Binding var isPopoverVisible: Bool
//
//    var body: some View {
//        ActionButton(action: {isPopoverVisible = false})
//    }
//}
//
//
//struct EntryIndikatorView: View {
//    @EnvironmentObject var modelView: ModelView
//    @ObservedObject var logModel: LogViewModel = LogViewModel()
//
//    @State private var isPupilPopoverVisible = false
//    @State private var isEkorPopoverVisible = false
//    @State private var isSuaraPopoverVisible = false
//    @State private var isBentukBadanPopoverVisible = false
//    @State private var isTelingaPopoverVisible = false
//
//    @State private var pupilDragAmount: CGPoint?
//    @State private var ekorDragAmount: CGPoint?
//    @State private var suaraDragAmount: CGPoint?
//    @State private var bentukBadanDragAmount: CGPoint?
//    @State private var telingaDragAmount: CGPoint?
//
//    var image: UIImage?
//
//
//    var body: some View {
//
//        ZStack {
//            Image(uiImage: image ?? UIImage(named: "image-observe")!)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//
//            VStack (alignment: .leading, spacing: 32) {
//                VStack(alignment: .center, spacing: 0) {
//                    Text("Seret dan lepas indikator ke bagian badan kucing pada gambar.")
//                        .font(.headline)
//                        .fontWeight(.semibold)
//                        .fontDesign(.rounded)
//                        .foregroundColor(Color("neutral800"))
//                        .padding(.horizontal, 16)
//                        .padding(.vertical, 16)
//                        .frame(maxWidth: .infinity, alignment: .center)
//                        .multilineTextAlignment(.center)
//
//
//                }
//                .background(RoundedRectangle(cornerRadius: 20)
//                    .foregroundColor(Color("orange200")))
//                .padding(.horizontal, 24)
//
//                .cornerRadius(20)
//
//                VStack(alignment: .trailing, spacing: 32) {
//
//                    // pupil
//                    GeometryReader { gp in // inisialisasi posisi di tengah
//                        ZStack {
//                            Button(action: {
//                                isPupilPopoverVisible = true
//                            }) {
//                                Image("pupil")
//
//                                    .frame(width:56, height: 56)
//                                    .background(
//                                        Circle()
//                                            .fill(Color("orange200"))
//                                    )
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 99)
//                                            .stroke(Color("orange200"), lineWidth: 15)
//                                            .opacity(0.1)
//                                    )
//
//                            }
//                            .popover(isPresented: $isPupilPopoverVisible, arrowEdge: .top) {
//                                VStack {
//                                    IndikatorPopOver(modelOpsi : opsiIndikatorLists[0], currentIndex: 0 ) { pilihan in
//                                        modelView.selectedPupil = pilihan
//                                        modelView.pupilInput = modelView.getPupilInput(pilihan: pilihan)
//                                    }
//
//                                    DismissButton(isPopoverVisible: $isPupilPopoverVisible)
//
//                                }
//                            }
//                            .animation(.default, value: pupilDragAmount)
//                            .position(self.pupilDragAmount ?? CGPoint(x: gp.size.width / 2, y: gp.size.height / 2))
//                            .highPriorityGesture(
//                                DragGesture()
//                                    .onChanged { self.pupilDragAmount = $0.location})
//                        }
//                        .frame(maxWidth: .infinity, maxHeight: .infinity) // fullscreen drag
//                    }
//
//                    // ekor
//                    GeometryReader { gp in // inisialisasi posisi di tengah
//                        ZStack {
//                            Button(action: {
//                                isEkorPopoverVisible = true
//                            }) {
//                                Image("ekor")
//
//                                    .frame(width:56, height: 56)
//                                    .background(
//                                        Circle()
//                                            .fill(Color("orange200"))
//                                    )
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 99)
//                                            .stroke(Color("orange200"), lineWidth: 15)
//                                            .opacity(0.1)
//                                    )
//
//                            }
//                            .popover(isPresented: $isEkorPopoverVisible, arrowEdge: .top) {
//                                VStack {
//                                    IndikatorPopOver(modelOpsi : opsiIndikatorLists[1], currentIndex: 1) { pilihan in
//                                        modelView.selectedEkor = pilihan
//                                        modelView.ekorInput = modelView.getEkorInput(pilihan: pilihan)
//                                    }
//                                    DismissButton(isPopoverVisible: $isEkorPopoverVisible)
//                                }
//                            }
//                            .animation(.default, value: ekorDragAmount)
//                            .position(self.ekorDragAmount ?? CGPoint(x: gp.size.width / 2, y: gp.size.height / 2))
//                            .highPriorityGesture(
//                                DragGesture()
//                                    .onChanged { self.ekorDragAmount = $0.location})
//                        }
//                        .frame(maxWidth: .infinity, maxHeight: .infinity) // fullscreen drag
//                    }
//
////                     suara
//                    GeometryReader { gp in // inisialisasi posisi di tengah
//                        ZStack {
//                            Button(action: {
//                                isSuaraPopoverVisible = true
//                            }) {
//                                Image("suara")
//
//                                    .frame(width:56, height: 56)
//                                    .background(
//                                        Circle()
//                                            .fill(Color("orange200"))
//                                    )
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 99)
//                                            .stroke(Color("orange200"), lineWidth: 15)
//                                            .opacity(0.1)
//                                    )
//
//                            }
//                            .popover(isPresented: $isSuaraPopoverVisible, arrowEdge: .top) {
//                                VStack {
//                                    IndikatorPopOver(modelOpsi : opsiIndikatorLists[2], currentIndex: 2) { pilihan in
//                                        modelView.selectedSuara = pilihan
//                                        modelView.suaraInput = modelView.getSuaraInput(pilihan: pilihan)
//                                    }
//
//                                    DismissButton(isPopoverVisible: $isSuaraPopoverVisible)
//                                }
//
//                            }
//                            .animation(.default, value: suaraDragAmount)
//                            .position(self.suaraDragAmount ?? CGPoint(x: gp.size.width / 2, y: gp.size.height / 2))
//                            .highPriorityGesture(
//                                DragGesture()
//                                    .onChanged { self.suaraDragAmount = $0.location})
//                        }
//                        .frame(maxWidth: .infinity, maxHeight: .infinity) // fullscreen drag
//                    }
//
//                    // bentuk badan
//                    GeometryReader { gp in // inisialisasi posisi di tengah
//                        ZStack {
//                            Button(action: {
//                                isBentukBadanPopoverVisible = true
//                            }) {
//                                Image("badan")
//
//                                    .frame(width:56, height: 56)
//                                    .background(
//                                        Circle()
//                                            .fill(Color("orange200"))
//                                    )
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 99)
//                                            .stroke(Color("orange200"), lineWidth: 15)
//                                            .opacity(0.1)
//                                    )
//
//                            }
//                            .popover(isPresented: $isBentukBadanPopoverVisible, arrowEdge: .top) {
//                                VStack {
//                                    IndikatorPopOver(modelOpsi : opsiIndikatorLists[3], currentIndex: 3) { pilihan in
//                                        modelView.selectedBentukBadan = pilihan
//                                        modelView.bentukBadanInput = modelView.getBentukBadanInput(pilihan: pilihan)
//                                    }
//
//                                    DismissButton(isPopoverVisible: $isBentukBadanPopoverVisible)
//                                }
//
//                            }
//                            .animation(.default, value: bentukBadanDragAmount)
//                            .position(self.bentukBadanDragAmount ?? CGPoint(x: gp.size.width / 2, y: gp.size.height / 2))
//                            .highPriorityGesture(
//                                DragGesture()
//                                    .onChanged { self.bentukBadanDragAmount = $0.location})
//                        }
//                        .frame(maxWidth: .infinity, maxHeight: .infinity) // fullscreen drag
//                    }
//
//                    // telinga
//                    GeometryReader { gp in // inisialisasi posisi di tengah
//                        ZStack {
//                            Button(action: {
//                                isTelingaPopoverVisible = true
//                            }) {
//                                Image("telinga")
//
//                                    .frame(width:56, height: 56)
//                                    .background(
//                                        Circle()
//                                            .fill(Color("orange200"))
//                                    )
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 99)
//                                            .stroke(Color("orange200"), lineWidth: 15)
//                                            .opacity(0.1)
//                                    )
//
//                            }
//                            .popover(isPresented: $isTelingaPopoverVisible, arrowEdge: .top) {
//                                VStack {
//                                    IndikatorPopOver(modelOpsi : opsiIndikatorLists[4], currentIndex: 4) { pilihan in
//                                        modelView.selectedTelinga = pilihan
//                                        modelView.telingaInput = modelView.getTelingaInput(pilihan: pilihan)
//                                    }
//
//                                    DismissButton(isPopoverVisible: $isTelingaPopoverVisible)
//                                }
//
//                            }
//                            .animation(.default, value: telingaDragAmount)
//                            .position(self.telingaDragAmount ?? CGPoint(x: gp.size.width / 2, y: gp.size.height / 2))
//                            .highPriorityGesture(
//                                DragGesture()
//                                    .onChanged { self.telingaDragAmount = $0.location})
//                        }
//                        .frame(maxWidth: .infinity, maxHeight: .infinity) // fullscreen drag
//                    }
//
//                }
//                .padding(.trailing, 24)
//                .onAppear {
//                    modelView.resetInputs()
//                }
//
//
//                NavigationLink(destination: SaveLog()
//                    .environmentObject(modelView)
//                    .environmentObject(logModel)
//
//                ) {
//
//                    Text("Analisa")
//                        .font(.headline)
//                        .fontWeight(.semibold)
//                        .fontDesign(.rounded)
//                        .frame(width: 342, height: 56)
//                        .background(Color("green800"))
//                        .foregroundColor(Color("neutral10"))
//                        .cornerRadius(20)
//                        .padding(24)
//                }
//            }
//
//            Spacer()
//        }
//
//    }
//}
