//
//  model.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 10/06/23.
//

//ini kode yang jalan


import SwiftUI
import CoreML

struct EntryDataView: View {
    @EnvironmentObject var modelView: ModelView

    @State private var isPupilPopoverVisible = false
    @State private var isEkorPopoverVisible = false
    @State private var isSuaraPopoverVisible = false
    @State private var isBentukBadanPopoverVisible = false
    @State private var isTelingaPopoverVisible = false

    var body: some View {
        VStack {
            Button(action: {
                isPupilPopoverVisible = true
            }) {
                Text("Pupil")
            }
            .popover(isPresented: $isPupilPopoverVisible, arrowEdge: .top) {
                VStack {
                    Pilihan(pilihan1: "Besar", pilihan2: "Kecil", pilihan3: "Normal") { pilihan in
                        modelView.selectedPupil = pilihan
                        modelView.pupilInput = modelView.getPupilInput(pilihan: pilihan)
                    }
                
                DismissButton(isPopoverVisible: $isPupilPopoverVisible)
                    
                }
            }
            

            Divider()

            Button(action: {
                isEkorPopoverVisible = true
            }) {
                Text("Ekor")
            }
            .popover(isPresented: $isEkorPopoverVisible, arrowEdge: .top) {
                VStack {
                    Pilihan(pilihan1: "Bergetar dengan cepat", pilihan2: "Menggoyangkan dengan cepat", pilihan3: "Mengibas-ibaskan", pilihan4: "Mengibaskan dengan tenang", pilihan5: "Terangkat tinggi dan gemetar") { pilihan in
                        modelView.selectedEkor = pilihan
                        modelView.ekorInput = modelView.getEkorInput(pilihan: pilihan)
                }
                    DismissButton(isPopoverVisible: $isEkorPopoverVisible)
                }
            }

            Divider()

            Button(action: {
                isSuaraPopoverVisible = true
            }) {
                Text("Suara")
            }
            .popover(isPresented: $isSuaraPopoverVisible, arrowEdge: .top) {
                VStack {
                    Pilihan(pilihan1: "Mendesis", pilihan2: "Mengeong", pilihan3: "Menggeram", pilihan4: "Tidak bersuara") { pilihan in
                        modelView.selectedSuara = pilihan
                        modelView.suaraInput = modelView.getSuaraInput(pilihan: pilihan)
                    }
                    
                    DismissButton(isPopoverVisible: $isSuaraPopoverVisible)
                }
                
            }

            Divider()
            
            Button(action: {
                isBentukBadanPopoverVisible = true
            }) {
                Text("Bentuk badan")
            }
            .popover(isPresented: $isBentukBadanPopoverVisible, arrowEdge: .top) {
                VStack {
                    Pilihan(pilihan1: "Badan melengkung ke bawah", pilihan2: "Badan menukik ke atas", pilihan3: "Berbaring melingkar", pilihan4: "Berbaring menyamping", pilihan5: "Berbaring terlentang", pilihan6: "Berdiri tegak", pilihan7: "Berjongkok", pilihan8: "Duduk tegak") { pilihan in
                        modelView.selectedBentukBadan = pilihan
                        modelView.bentukBadanInput = modelView.getBentukBadanInput(pilihan: pilihan)
                    }
                    
                    DismissButton(isPopoverVisible: $isBentukBadanPopoverVisible)
                }
                
            }

            Divider()

            Button(action: {
                isTelingaPopoverVisible = true
            }) {
                Text("Telinga")
            }
            .popover(isPresented: $isTelingaPopoverVisible, arrowEdge: .top) {
                VStack {
                    Pilihan(pilihan1: "Menutup ke depan", pilihan2: "Miring ke samping", pilihan3: "Tegak", pilihan4: "Tertarik ke belakang") { pilihan in
                        modelView.selectedTelinga = pilihan
                        modelView.telingaInput = modelView.getTelingaInput(pilihan: pilihan)
                    }
                    
                    DismissButton(isPopoverVisible: $isTelingaPopoverVisible)
                }
                
            }

        }
        .onAppear {
            modelView.resetInputs()
        }
    }
}
