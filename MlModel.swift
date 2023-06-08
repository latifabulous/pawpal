//
//  MlModel.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 08/06/23.
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
                    Pilihan(pilihan1: "besar", pilihan2: "sedang", pilihan3: "kecil") { pilihan in
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
                    Pilihan(pilihan1: "pendek", pilihan2: "panjang") { pilihan in
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
                    Pilihan(pilihan1: "nyaring", pilihan2: "halus", pilihan3: "pelan") { pilihan in
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
                    Pilihan(pilihan1: "kurus", pilihan2: "gemuk") { pilihan in
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
                    Pilihan(pilihan1: "turun", pilihan2: "tegak") { pilihan in
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
        case "besar":
            return [1.0, 0.0, 0.0]
        case "sedang":
            return [0.0, 1.0, 0.0]
        case "kecil":
            return [0.0, 0.0, 1.0]
        default:
            return [0.0, 0.0, 0.0]
        }
    }

    private func getEkorInput(pilihan: String) -> [Double] {
        switch pilihan {
        case "pendek":
            return [1.0, 0.0]
        case "panjang":
            return [0.0, 1.0]
        default:
            return [0.0, 0.0]
        }
    }

    private func getSuaraInput(pilihan: String) -> [Double] {
        switch pilihan {
        case "nyaring":
            return [1.0, 0.0, 0.0]
        case "halus":
            return [0.0, 1.0, 0.0]
        case "pelan":
            return [0.0, 0.0, 1.0]
        default:
            return [0.0, 0.0, 0.0]
        }
    }

    private func getBentukBadanInput(pilihan: String) -> [Double] {
        switch pilihan {
        case "kurus":
            return [1.0, 0.0]
        case "gemuk":
            return [0.0, 1.0]
        default:
            return [0.0, 0.0]
        }
    }

    private func getTelingaInput(pilihan: String) -> [Double] {
        switch pilihan {
        case "turun":
            return [1.0, 0.0]
        case "tegak":
            return [0.0, 1.0]
        default:
            return [0.0, 0.0]
        }
    }

    private func resetInputs() {
        modelView.pupilInput = [0, 0, 0]
        modelView.ekorInput = [0, 0]
        modelView.suaraInput = [0, 0, 0]
        modelView.bentukBadanInput = [0, 0]
        modelView.telingaInput = [0, 0]
    }
}

//struct Pilihan: View {
//    var pilihan1: String = ""
//    var pilihan2: String = ""
//    var pilihan3: String = ""
//    var action: (String) -> Void
//
//    var body: some View {
//        VStack {
//            Button(action: {
//                action(pilihan1)
//
//            }, label: {
//                Text(pilihan1)
//
//            })
//
//            Divider()
//
//            Button(action: {
//                action(pilihan2)
//            }, label: {
//                Text(pilihan2)
//            })
//
//            Divider()
//
//            Button(action: {
//                action(pilihan3)
//            }, label: {
//                Text(pilihan3)
//            })
//        }
//    }
//}

struct Pilihan: View {
    var pilihan1: String = ""
    var pilihan2: String = ""
    var pilihan3: String = ""
    var action: (String) -> Void

    @State private var selectedPilihan: String = ""

    var body: some View {
        VStack {
            Button(action: {
                selectedPilihan = pilihan1
                action(pilihan1)
            }, label: {
                Text(pilihan1)
                    .foregroundColor(selectedPilihan == pilihan1 ? .white : .black)
                    .padding()
                    .background(selectedPilihan == pilihan1 ? Color.blue : Color.clear)
                    .cornerRadius(10)
            })

            Divider()

            Button(action: {
                selectedPilihan = pilihan2
                action(pilihan2)
            }, label: {
                Text(pilihan2)
                    .foregroundColor(selectedPilihan == pilihan2 ? .white : .black)
                    .padding()
                    .background(selectedPilihan == pilihan2 ? Color.blue : Color.clear)
                    .cornerRadius(10)
            })

            Divider()

            Button(action: {
                selectedPilihan = pilihan3
                action(pilihan3)
            }, label: {
                Text(pilihan3)
                    .foregroundColor(selectedPilihan == pilihan3 ? .white : .black)
                    .padding()
                    .background(selectedPilihan == pilihan3 ? Color.blue : Color.clear)
                    .cornerRadius(10)
            })
        }
    }
}


class ModelView: ObservableObject {
    let model = DecisionTreeModel()
    @Published var predictionResult = ""

    @Published var pupilInput: [Double] = [0, 0, 0]
    @Published var ekorInput: [Double] = [0, 0]
    @Published var suaraInput: [Double] = [0, 0, 0]
    @Published var bentukBadanInput: [Double] = [0, 0]
    @Published var telingaInput: [Double] = [0, 0]

    func predict() {
        do {
            let input = try MLMultiArray(shape: [12], dataType: .double)
            
            input[0] = pupilInput[0] as NSNumber
            input[1] = pupilInput[2] as NSNumber
            input[2] = pupilInput[1] as NSNumber
            input[3] = ekorInput[1] as NSNumber
            input[4] = ekorInput[0] as NSNumber
            input[5] = suaraInput[1] as NSNumber
            input[6] = suaraInput[0] as NSNumber
            input[7] = suaraInput[2] as NSNumber
            input[8] = bentukBadanInput[1] as NSNumber
            input[9] = bentukBadanInput[0] as NSNumber
            input[10] = telingaInput[1] as NSNumber
            input[11] = telingaInput[0] as NSNumber

            let modelInput = DecisionTreeModelInput(input: input)
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


