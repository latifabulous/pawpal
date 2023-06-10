//
//  MLModel.swift
//  pawpal
//
//  Created by ni nyoman putri shopia yuandari on 10/06/23.
//

import SwiftUI
import CoreML

class ModelView: ObservableObject {
    let model = pawpal()
    @Published var predictionResult = ""

    @Published var pupilInput: [Double] = [0, 0, 0]
    @Published var ekorInput: [Double] = [0, 0, 0, 0, 0]
    @Published var suaraInput: [Double] = [0, 0, 0]
    @Published var bentukBadanInput: [Double] = [0, 0, 0, 0, 0, 0, 0, 0]
    @Published var telingaInput: [Double] = [0, 0, 0, 0]

    @Published var selectedPupil: String = ""
    @Published var selectedEkor: String = ""
    @Published var selectedSuara: String = ""
    @Published var selectedBentukBadan: String = ""
    @Published var selectedTelinga: String = ""

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
    
    func getPupilInput(pilihan: String) -> [Double] {
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

    func getEkorInput(pilihan: String) -> [Double] {
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

    func getSuaraInput(pilihan: String) -> [Double] {
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

    func getBentukBadanInput(pilihan: String) -> [Double] {
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

    func getTelingaInput(pilihan: String) -> [Double] {
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
    
    func resetInputs() {
        pupilInput = [0, 0, 0]
        ekorInput = [0, 0, 0, 0, 0]
        suaraInput = [0, 0, 0, 0]
        bentukBadanInput = [0, 0, 0, 0, 0, 0, 0, 0]
        telingaInput = [0, 0, 0, 0]
    }

}
