//
//  PawCamView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 12/06/23.
//


import SwiftUI
import UIKit

struct PawCamView: View {
    @State private var isShowingCamera = false
    @State private var selectedImage: UIImage?
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var logModel: LogViewModel = LogViewModel()
    @StateObject var modelView = ModelView()
    
    @State private var isShowingModal = false
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = selectedImage {
//                    Spacer()
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                    
                    
                    Spacer()
                    
                    NavigationLink(destination:
                                    EntryIndikatorView(image: image)
                                        .environmentObject(modelView)
                                        .environmentObject(logModel)
                                   
//                             
                                   , label:{
                        Text("Selanjutnya")
                            .foregroundColor(Color("neutral10"))
                            .font(.headline)
                            .fontWeight(.semibold)
                            .frame(width: 342, height: 56)
                            .background(Color("orange600"))
                            .cornerRadius(20)
                    })
                    .padding()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack (alignment: .leading, spacing: 8){
                            Text("Observasi bahasa tubuh Koyumi sekarang")
                                .font(.title2)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .foregroundColor(Color("neutral800"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Tambahkan foto dan dapatkan hasil analisa.")
                                .font(.body)
                                .fontWeight(.regular)
                                .fontDesign(.rounded)
                                .foregroundColor(Color("neutral400"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 24)
                        
                        Button(action: {
                            isShowingCamera = true
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size:36))
                                .foregroundColor(Color("neutral10"))
                                .frame(width: 152, height: 152)
                                .background(
                                    Circle()
                                        .fill(Color("orange600"))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 99)
                                                            .stroke(Color("orange200"), lineWidth: 15)
                                                            .opacity(1)
                                )
                        }
                        .padding()
                        .sheet(isPresented: $isShowingCamera) {
                            ImagePickerView(image: $selectedImage)
                        }
                        .padding(.bottom, 24)
                        
                        Divider()
                            .padding(.bottom, 24)
                            .padding(.horizontal, 24)
                        
                        VStack (alignment: .leading, spacing: 8){
                            Text("Mari lakukan langkah langkah ini")
                                .font(.title2)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .foregroundColor(Color("neutral800"))
                            
                            Text("ini akan membantumu mengetahui keinginan kucingmu.")
                                .font(.body)
                                .fontWeight(.regular)
                                .fontDesign(.rounded)
                                .foregroundColor(Color("neutral400"))
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 24)
                        
                        
                        VStack(alignment: .center, spacing: 24) {
                            VStack{
                                Image("tutorial-foto")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                Text("Arahkan kamera ke arah kucingmu")
                                    .font(.body)
                                    .fontWeight(.regular)
                                    .fontDesign(.rounded)
                                    .foregroundColor(Color("neutral800"))
                            }
                            
                            VStack{
                                Image("tutorial-drag")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                Text("Masukkan bahasa tubuh yang ditunjukkan koyumi berdasarkan tiap indikator")
                                    .font(.body)
                                    .fontWeight(.regular)
                                    .fontDesign(.rounded)
                                    .foregroundColor(Color("neutral800"))
                                    .multilineTextAlignment(.center)
                            }
                            
                            VStack{
                                Image("tutorial-log")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                Text("Dapatkan hasil analisa terkait perilaku")
                                    .font(.body)
                                    
                                    .fontWeight(.regular)
                                    .fontDesign(.rounded)
                                    .foregroundColor(Color("neutral800"))
                            }
                        }
                        .padding(.horizontal, 24)
                        
                        
                    }
                    
                }
            }
            .navigationBarItems(
                        leading: Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                            Text("Kembali")
                                .font(.headline)
                                .fontWeight(.regular)
                                .fontDesign(.rounded)
                        },
                        trailing: Button(action: {
                            isShowingModal = true
                        }) {
                            Image(systemName: "info.circle")
                            
                        }
                            .sheet(isPresented: $isShowingModal) {
                                InformationView()
                            }
                    )
            
            
        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator
        imagePickerController.sourceType = .camera
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePickerView
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.image = selectedImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ObserveView: View {

    var image: UIImage?
    var body: some View {
        VStack {
            Image(uiImage: image ?? UIImage(named: "image-observe")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .padding()
            
            Text("Halaman detail observasi")

        }
    }
}

struct PawCamView_Previews: PreviewProvider {
    static var previews: some View {
        PawCamView()
    }
}
