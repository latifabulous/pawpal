//
//  AnalysisResult.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 10/06/23.
//

import SwiftUI
import CoreML
import CoreData

struct AnalysisResultScreen: View {
    @EnvironmentObject var modelView: ModelView
    @Environment(\.managedObjectContext) private var context
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    Spacer()
                        .frame(height: 40)
                    Text ("Hasil analisa kami")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("neutral400"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 2)
                    
                    //hasil kebutuhan kucing
                    Text ("\(JudulKebutuhan(selectedJudulKebutuhan: modelView.predictionResult).description)")
                        .font(.title)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("neutral800"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //elaborasi kebutuhan
                    Text("\(KondisiKebutuhan(selectedKebutuhan: modelView.predictionResult).description)")
                        .font(.headline)
                        .fontWeight(.regular)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("neutral800"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 16)
                        .padding(.bottom, 24)
                }
                
                Divider()
                    .padding(.bottom, 24)
                
                
                Image("cat-placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 345, height: 247)
                    .padding(.bottom, 32)
                
                ForEach(0..<5) { index in
                    PenjelasanSelectedIndicator(index: index)
                }
                
                NavigationLink(destination:
                                LogView().environmentObject(modelView)
                ) {
                    
                    Text("Pergi ke log")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("neutral10"))
                        .background(Color("orange600")
                            .cornerRadius(20)
                            .frame(width: 342, height: 56)
                                    
                        )
                    
                }
                
            }
            .padding(.horizontal, 24)
            .interactiveDismissDisabled()
        }
    }
}

struct PenjelasanSelectedIndicator: View {
    @EnvironmentObject var modelView: ModelView
    
    var index: Int
    var distance: CGFloat = 12.0
    var img: String = "cat-placeholder"
    
    var body: some View {
        HStack {
            Image(img)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 113)
            
            VStack {
                Text(getName(index: index))
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("neutral800"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                    .frame(height: 8)
                
                Text(getDescription(index: index))
                    .font(.footnote)
                    .fontWeight(.regular)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("neutral600"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                    .frame(height: distance)
            }
        }
        .padding(.vertical, 12)
    }
    
    func getName(index: Int) -> String {
        switch index {
        case 0:
            return modelView.selectedPupil
        case 1:
            return modelView.selectedEkor
        case 2:
            return modelView.selectedSuara
        case 3:
            return modelView.selectedBentukBadan
        case 4:
            return modelView.selectedTelinga
        default:
            return ""
        }
    }
    
    func getDescription(index: Int) -> String {
        switch index {
        case 0:
            return KondisiPupil(selectedPupil: modelView.selectedPupil).description
        case 1:
            return KondisiEkor(selectedEkor: modelView.selectedEkor).description
        case 2:
            return KondisiSuara(selectedSuara: modelView.selectedSuara).description
        case 3:
            return KondisiBentukBadan(selectedBentukBadan: modelView.selectedBentukBadan).description
        case 4:
            return KondisiTelinga(selectedTelinga: modelView.selectedTelinga).description
        default:
            return ""
        }
    }
}


struct AnalysisResultScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        let modelView = ModelView() // Membuat objek ModelView di dalam blok previews
        return AnalysisResultScreen()
            .environmentObject(modelView)
    }
}
