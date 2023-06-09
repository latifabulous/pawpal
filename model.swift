//
//  model.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 10/06/23.
//

//ini kode yang jalan


import SwiftUI
import CoreML

struct DismissButton: View {
    @Binding var isPopoverVisible: Bool
    
    var body: some View {
        Button(action: {
            isPopoverVisible = false
        }) {
            Text("Save")
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct OptionButton: View {
    var pilihan: String
//    var action: (String) -> Void

    @State private var selectedPilihan: String = ""
    
    var body: some View {
        Button(action: {
            selectedPilihan = pilihan
//            action(pilihan)
        }, label: {
            Text(pilihan)
                .foregroundColor(selectedPilihan == pilihan ? .white : .black)
                .padding()
                .background(selectedPilihan == pilihan ? Color.blue : Color.clear)
                .cornerRadius(10)
        })
        
    }
}

struct PopoverButtonStyle: ButtonStyle {
    var isActive: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(isActive ? Color.blue : Color.clear)
            .foregroundColor(isActive ? .white : .black)
            .cornerRadius(5)
    }
}

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
                        modelView.pupilInput = getPupilInput(pilihan: pilihan)
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
                        modelView.ekorInput = getEkorInput(pilihan: pilihan)
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
                        modelView.suaraInput = getSuaraInput(pilihan: pilihan)
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
                        modelView.bentukBadanInput = getBentukBadanInput(pilihan: pilihan)
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
                        modelView.telingaInput = getTelingaInput(pilihan: pilihan)
                    }
                    
                    DismissButton(isPopoverVisible: $isTelingaPopoverVisible)
                }
                
            }

        }
        .onAppear {
            resetInputs()
        }
    }

    private func getPupilInput(pilihan: String) -> [Double] {
        switch pilihan {
        case "Besar":
            return [1.0, 0.0, 0.0]
        case "Kecil":
            return [0.0, 1.0, 0.0]
        case "Normal":
            return [0.0, 0.0, 1.0]
        default:
            return [0.0, 0.0, 0.0]
        }
    }

    private func getEkorInput(pilihan: String) -> [Double] {
        switch pilihan {
        case "Bergetar dengan cepat":
            return [1.0, 0.0, 0.0, 0.0, 0.0]
        case "Menggoyangkan dengan cepat":
            return [0.0, 1.0, 0.0, 0.0, 0.0]
        case "Mengibas-ibaskan":
            return [0.0, 0.0, 1.0, 0.0, 0.0]
        case "Mengibaskan dengan tenang":
            return [0.0, 0.0, 0.0, 1.0, 0.0]
        case "Terangkat tinggi dan gemetar":
            return [0.0, 0.0, 0.0, 0.0, 1.0]
        default:
            return [0.0, 0.0, 0.0, 0.0, 0.0]
        }
    }

    private func getSuaraInput(pilihan: String) -> [Double] {
        switch pilihan {
        case "Mendesis":
            return [1.0, 0.0, 0.0, 0.0]
        case "Mengeong":
            return [0.0, 1.0, 0.0, 0.0]
        case "Menggeram":
            return [0.0, 0.0, 1.0, 0.0]
        case "Tidak bersuara":
            return [0.0, 0.0, 0.0, 0.0]
        default:
            return [0.0, 0.0, 0.0, 0.0]
        }
    }

    private func getBentukBadanInput(pilihan: String) -> [Double] {
        switch pilihan {
        case "Badan melengkung ke bawah":
            return [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        case "Badan menukik ke atas":
            return [0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        case "Berbaring melingkar":
            return [0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        case "Berbaring menyamping":
            return [0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0]
        case "Berbaring terlentang":
            return [0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0]
        case "Berdiri tegak":
            return [0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0]
        case "Berjongkok":
            return [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0]
        case "Duduk tegak":
            return [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0]
        default:
            return [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        }
    }

    private func getTelingaInput(pilihan: String) -> [Double] {
        switch pilihan {
        case "Menutup ke depan":
            return [1.0, 0.0, 0.0, 0.0]
        case "Miring ke samping":
            return [0.0, 1.0, 0.0, 0.0]
        case "Tegak":
            return [0.0, 0.0, 1.0, 0.0]
        case "Tertarik ke belakang":
            return [0.0, 0.0, 0.0, 1.0]
        default:
            return [0.0, 0.0, 0.0, 0.0]
        }
    }

    private func resetInputs() {
        modelView.pupilInput = [0, 0, 0]
        modelView.ekorInput = [0, 0, 0, 0, 0]
        modelView.suaraInput = [0, 0, 0, 0]
        modelView.bentukBadanInput = [0, 0, 0, 0, 0, 0, 0, 0]
        modelView.telingaInput = [0, 0, 0, 0]
    }
}



struct Pilihan: View {
    var pilihan1: String = " "
    var pilihan2: String = " "
    var pilihan3: String = " "
    var pilihan4: String = " "
    var pilihan5: String = " "
    var pilihan6: String = " "
    var pilihan7: String = " "
    var pilihan8: String = " "
    var action: (String) -> Void

    @State private var selectedPilihan: String = ""

    var body: some View {
        VStack {
            
            Button(action: {
                selectedPilihan = pilihan1
                action(pilihan1)
            }) {
                Text(pilihan1)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan1))
            
            Button(action: {
                selectedPilihan = pilihan2
                action(pilihan2)
            }) {
                Text(pilihan2)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan2))
            
            Button(action: {
                selectedPilihan = pilihan3
                action(pilihan3)
            }) {
                Text(pilihan3)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan3))
            
            Button(action: {
                selectedPilihan = pilihan4
                action(pilihan4)
            }) {
                Text(pilihan4)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan4))
            
            Button(action: {
                selectedPilihan = pilihan5
                action(pilihan5)
            }) {
                Text(pilihan5)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan5))
            
            Button(action: {
                selectedPilihan = pilihan6
                action(pilihan6)
            }) {
                Text(pilihan6)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan6))
            
            Button(action: {
                selectedPilihan = pilihan7
                action(pilihan7)
            }) {
                Text(pilihan7)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan7))
            
            Button(action: {
                selectedPilihan = pilihan8
                action(pilihan8)
            }) {
                Text(pilihan8)
            }
            .buttonStyle(PopoverButtonStyle(isActive: selectedPilihan == pilihan8))

        }
    }
}


class ModelView: ObservableObject {
    let model = pawpal()
    @Published var predictionResult = ""

    @Published var pupilInput: [Double] = [0, 0, 0]
    @Published var ekorInput: [Double] = [0, 0, 0, 0, 0]
    @Published var suaraInput: [Double] = [0, 0, 0]
    @Published var bentukBadanInput: [Double] = [0, 0, 0, 0, 0, 0, 0, 0]
    @Published var telingaInput: [Double] = [0, 0, 0, 0]

    func predict() {
        do {
            let input = try MLMultiArray(shape: [24], dataType: .double)
            
            input[0] = pupilInput[0] as NSNumber
            input[1] = pupilInput[1] as NSNumber
            input[2] = pupilInput[2] as NSNumber
            input[3] = telingaInput[0] as NSNumber
            input[4] = telingaInput[1] as NSNumber
            input[5] = telingaInput[2] as NSNumber
            input[6] = telingaInput[3] as NSNumber
            input[7] = suaraInput[0] as NSNumber
            input[8] = suaraInput[1] as NSNumber
            input[9] = suaraInput[3] as NSNumber
            input[10] = suaraInput[2] as NSNumber
            input[11] = ekorInput[0] as NSNumber
            input[12] = ekorInput[1] as NSNumber
            input[13] = ekorInput[2] as NSNumber
            input[14] = ekorInput[3] as NSNumber
            input[15] = ekorInput[4] as NSNumber
            input[16] = bentukBadanInput[0] as NSNumber
            input[17] = bentukBadanInput[1] as NSNumber
            input[18] = bentukBadanInput[2] as NSNumber
            input[19] = bentukBadanInput[3] as NSNumber
            input[20] = bentukBadanInput[4] as NSNumber
            input[21] = bentukBadanInput[5] as NSNumber
            input[22] = bentukBadanInput[6] as NSNumber
            input[23] = bentukBadanInput[7] as NSNumber

            let modelInput = pawpalInput(input: input)
            let prediction = try model.prediction(input: modelInput)
            let output = prediction.classLabel

            predictionResult = "Prediksi kebutuhan kucing: \(output)"
            print("Prediksi kebutuhan kucing: \(output)")
        } catch {
            predictionResult = "Error: \(error)"
        }
    }
}


struct FinalView: View {
    @EnvironmentObject var modelView: ModelView

    var body: some View {
        VStack {
            Text("Prediction: \(modelView.predictionResult)")
                .padding()

            EntryDataView()

            Button(action: {
                modelView.predict()
            }) {
                Text("Predict")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}


struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        let modelView = ModelView() // Membuat objek ModelView di dalam blok previews
        return FinalView()
            .environmentObject(modelView)
    }
}




