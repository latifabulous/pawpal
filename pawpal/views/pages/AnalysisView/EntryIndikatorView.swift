//
//  model.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 10/06/23.
//

//ini kode yang jalan


import SwiftUI
import CoreML

struct EntryIndikatorView: View {
    @EnvironmentObject var modelView: ModelView
    @ObservedObject var logModel: LogViewModel = LogViewModel()
    @StateObject var entryIndikatorViewModel = EntryIndikatorViewModel ()
    
    var image: UIImage?
    
    var body: some View {
        
        ZStack {
            Image(uiImage: image ?? UIImage(named: "image-observe")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack (alignment: .leading, spacing: 32) {
                VStack(alignment: .center, spacing: 0) {
                    Text("Seret dan lepas indikator ke bagian badan kucing pada gambar.")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("neutral800"))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                    
                    
                }
                .background(RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("orange200")))
                .padding(.horizontal, 24)
                
                .cornerRadius(20)
                
                VStack(alignment: .trailing, spacing: 32) {
                    
                    //pupil
                    IndikatorView(
                        imageName: "pupil",
                        popoverContent: IndikatorPopOver(modelOpsi: opsiIndikatorLists[0], currentIndex: 0, action: { option in
                            modelView.selectedPupil = option
                            modelView.pupilInput = modelView.getPupilInput(pilihan: option)
                        }),
                        isPopoverVisible: $entryIndikatorViewModel.isPupilPopoverVisible, dragAmount: $entryIndikatorViewModel.pupilDragAmount
                    )
                    
                    //telinga
                    IndikatorView(
                        imageName: "telinga",
                        popoverContent: IndikatorPopOver(modelOpsi: opsiIndikatorLists[4], currentIndex: 4, action: { option in
                            modelView.selectedTelinga = option
                            modelView.telingaInput = modelView.getTelingaInput(pilihan: option)
                        }),
                        isPopoverVisible: $entryIndikatorViewModel.isTelingaPopoverVisible, dragAmount: $entryIndikatorViewModel.telingaDragAmount
                    )
                    
                    //suara
                    IndikatorView(
                        imageName: "suara",
                        popoverContent: IndikatorPopOver(modelOpsi: opsiIndikatorLists[2], currentIndex: 2, action: { option in
                            modelView.selectedSuara = option
                            modelView.suaraInput = modelView.getSuaraInput(pilihan: option)
                        }),
                        isPopoverVisible: $entryIndikatorViewModel.isSuaraPopoverVisible, dragAmount: $entryIndikatorViewModel.suaraDragAmount
                    )
                    
                    //ekor
                    IndikatorView(
                        imageName: "ekor",
                        popoverContent: IndikatorPopOver(modelOpsi: opsiIndikatorLists[1], currentIndex: 1, action: { option in
                            modelView.selectedEkor = option
                            modelView.ekorInput = modelView.getEkorInput(pilihan: option)
                        }),
                        isPopoverVisible: $entryIndikatorViewModel.isEkorPopoverVisible, dragAmount: $entryIndikatorViewModel.ekorDragAmount
                    )
                    
                    //bentuk badan
                    IndikatorView(
                        imageName: "badan",
                        popoverContent: IndikatorPopOver(modelOpsi: opsiIndikatorLists[3], currentIndex: 3, action: { option in
                            modelView.selectedBentukBadan = option
                            modelView.bentukBadanInput = modelView.getBentukBadanInput(pilihan: option)
                        }),
                        isPopoverVisible: $entryIndikatorViewModel.isBentukBadanPopoverVisible, dragAmount: $entryIndikatorViewModel.bentukBadanDragAmount
                    )
                    
                    
                }
                .padding(.trailing, 24)
                .onAppear {
                    modelView.resetInputs()
                }
                
                
                NavigationLink(destination: SaveLog()
                    .environmentObject(modelView)
                    .environmentObject(logModel)
                               
                ) {
                    
                    Text("Analisa")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .frame(width: 342, height: 56)
                        .background(Color("green800"))
                        .foregroundColor(Color("neutral10"))
                        .cornerRadius(20)
                        .padding(24)
                }
            }
            
            Spacer()
        }
        
    }
}
