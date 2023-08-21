//
//  PawCamView.swift
//  pawpal
//
//  Created by Nur Izza Latifah on 12/06/23.
//

import SwiftUI

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
                        
                        VStack (spacing: 8){
                            Title2Text(text: "Observasi bahasa tubuh Koyumi sekarang")
                                .fontWeight(.bold)
                                .padding(.bottom, 8)
                            
                            BodyText(text: "Tambahkan foto dan dapatkan hasil analisa.")
                            
                        }
                        
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
                        .padding(.bottom, 32)
                        
                        //MARK: tutorial
                        Group {
                            Title2Text(text: "Mari lakukan langkah langkah ini")
                                .fontWeight(.bold)
                                .padding(.bottom, 8)
                            
                            BodyText(text: "ini akan membantumu mengetahui keinginan kucingmu.")
                                .padding(.bottom, 24)
                            
                            ForEach(tutorialLists) { itm in
                                Image(itm.image)
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                
                                Text(itm.description)
                                    .font(.body)
                                    .fontWeight(.regular)
                                    .fontDesign(.rounded)
                                    .foregroundColor(Color("neutral800"))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 24)
                            }
                        }
                        
                    }
                }
            }
            .padding(.horizontal, 24)
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

struct PawCamView_Previews: PreviewProvider {
    static var previews: some View {
        PawCamView()
    }
}
