import SwiftUI

let totalPage = 3

struct OnboardingScreen: View {
    @AppStorage("hasCompletedOnboarding")
    var hasCompletedOnboarding = false

    @ObservedObject var logModel: LogViewModel = LogViewModel()
    @StateObject var modelView = ModelView()


    var body: some View {
        Group {
            if hasCompletedOnboarding {
                PawTabView().environmentObject(logModel)
//                PawView().environmentObject(logModel)
            } else {
                OnboardingView()
            }
        }
    }
}


struct OnboardingView: View {

    @AppStorage("username")
    var username = ""

    @State private var currentPage = 1
    @State private var isUsernameEmpty = true


    var body: some View {
        VStack {
            if currentPage == 1 {
                OnboardingInfo(description: "Mari pahami bahasa tubuh kucing untuk memenuhi kebutuhan mereka dengan lebih baik.", background: "onboarding-1", currentPage: $currentPage)
            } else if currentPage == 2 {
                OnboardingInfo(description: "Memudahkan analisa perilaku kucing dengan 5 indikator bagian tubuh kucing.", background: "onboarding-2", currentPage: $currentPage)
            } else if currentPage == 3 {
                OnboardingInfo(description: "Simpan hasil analisa, dan lihat hasil catatan perilaku kucing kamu setiap harinya.", background: "onboarding-3", currentPage: $currentPage)
            } else if currentPage == 4 {
                PawNameView(currentPage: $currentPage, username: $username, isUsernameEmpty: $isUsernameEmpty, background: "onboarding-4")
            } else if currentPage == 5 {
                PawAgeView(currentPage: $currentPage, username: $username, background: "onboarding-4")
            }
        }
        .onDisappear {
            UserDefaults.standard.set(currentPage, forKey: "currentPage")
        }
    }
}

struct OnboardingInfo: View {
    var image: String = ""
    var title: String = ""
    var description: String = ""
    var background: String = ""
    @Binding var currentPage: Int

    var body: some View {
        ZStack {
            Image (background)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
//                HStack {
//                    if currentPage == 1 {
//                        Color(.blue).frame(height: 8 / UIScreen.main.scale)
//                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
//                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
//                    } else if currentPage == 2 {
//                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
//                        Color(.blue).frame(height: 8 / UIScreen.main.scale)
//                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
//                    } else if currentPage == 3 {
//                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
//                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
//                        Color(.blue).frame(height: 8 / UIScreen.main.scale)
//                    }
//                }

                HStack {
                    Spacer()
                    Button(action: {
                        currentPage = 4
                    }, label: {
                        Text("Skip")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                    })
                }
                

                Text(image)
                    .font(.title)
                Text(title)
                    .font(.title)
                Text(description)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.top, 24)
                

                Button(action: {
                    if currentPage < 3 {
                        currentPage += 1
                    } else {
                        currentPage = 4
                    }
                }) {
                    if currentPage == 3 {
                        Text("Get Started")
                    } else {
                        Text("Next")
                    }
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

struct OptionView: View {
    var option: String
    var isSelected: Bool
    var action: () -> Void
    var rangeAge: String

    var body: some View {
        Button(action: action) {
            Circle()
                .stroke(isSelected ? Color("orange600") : Color("orange400"), lineWidth: isSelected ? 3 : 1)
                .frame(width: 163, height: 163)
                .overlay(
                    VStack {
                        Text(option)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.black)

                        Text(rangeAge)
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                            .foregroundColor(.black)

                    }

                )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}





//import SwiftUI
//
//let totalPage = 3
//
//struct OnboardingScreen: View {
//    @AppStorage("hasCompletedOnboarding")
//    var hasCompletedOnboarding = false
//
//    var body: some View {
//        Group {
//            if hasCompletedOnboarding {
//                DashboardView()
//            } else {
//                OnboardingView()
//            }
//        }
//    }
//}
//
//struct DashboardView: View {
//    @AppStorage("username")
//    var username = ""
//
//    @AppStorage("selectedAge") var selectedAge = ""
//
//    var body: some View {
//        VStack {
//            Text("Selamat datang, \(username)!")
//                .font(.title)
//                .padding()
//
//            Text("dengan umur \(selectedAge)")
//                .font(.title)
//                .padding()
//        }
//    }
//}
//
//struct OnboardingView: View {
//
//    @AppStorage("username")
//    var username = ""
//
//    @State private var currentPage = 1
//    @State private var isUsernameEmpty = true
//
//
//    var body: some View {
//        VStack {
//            if currentPage == 1 {
//                OnboardingInfo(image: "onboarding", title: "Makanan", description: "lallala", background: "onboarding-1", currentPage: $currentPage)
//            } else if currentPage == 2 {
//                OnboardingInfo(image: "onboarding-1", title: "Lapar", description: "lallala", background: "onboarding-2", currentPage: $currentPage)
//            } else if currentPage == 3 {
//                OnboardingInfo(image: "onboarding-2", title: "Minum", description: "lallala", background: "onboarding-1", currentPage: $currentPage)
//            } else if currentPage == 4 {
//                NameInputView(currentPage: $currentPage, username: $username, isUsernameEmpty: $isUsernameEmpty, background: "onboarding-2")
//            } else if currentPage == 5 {
//                AgeInputView (currentPage: $currentPage, username: $username, background: "onboarding-2")
//            }
//        }
//        .onDisappear {
//            UserDefaults.standard.set(currentPage, forKey: "currentPage")
//        }
//    }
//}
//
//struct OnboardingInfo: View {
//    var image: String
//    var title: String
//    var description: String
//    var background: String
//    @Binding var currentPage: Int
//
//    var body: some View {
//        ZStack {
//            Image (background)
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
//
//            VStack {
////                HStack {
////                    if currentPage == 1 {
////                        Color(.blue).frame(height: 8 / UIScreen.main.scale)
////                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
////                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
////                    } else if currentPage == 2 {
////                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
////                        Color(.blue).frame(height: 8 / UIScreen.main.scale)
////                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
////                    } else if currentPage == 3 {
////                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
////                        Color(.gray).frame(height: 8 / UIScreen.main.scale)
////                        Color(.blue).frame(height: 8 / UIScreen.main.scale)
////                    }
////                }
//
//                Button(action: {
//                    currentPage = 4
//                }, label: {
//                    Text("Skip")
//                })
//
//                Text(image)
//                    .font(.title)
//                Text(title)
//                    .font(.title)
//                Text(description)
//                    .font(.body)
//
//                Button(action: {
//                    if currentPage < 3 {
//                        currentPage += 1
//                    } else {
//                        currentPage = 4
//                    }
//                }) {
//                    if currentPage == 3 {
//                        Text("Get Started")
//                    } else {
//                        Text("Next")
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct NameInputView: View {
//    @Binding var currentPage: Int
//    @Binding var username: String
//    @Binding var isUsernameEmpty: Bool
//
//    var background: String
//
//    var body: some View {
//        ZStack {
//            Image (background)
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
//
//            VStack {
//                HStack {
//                    Color("orange600").frame(height: 10 / UIScreen.main.scale)
//                        .cornerRadius(20)
//                    Color("orange400").frame(height: 10 / UIScreen.main.scale)
//                        .cornerRadius(20)
//                }
//
//                Spacer()
//                    .frame(height: 48)
//
//                Text("Siapa nama kucingmu?")
//                    .font(.system(size: 28, weight: .bold, design: .rounded))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//
//                Spacer ()
//                    .frame(height: 20)
//
//                TextField("Nama kucing", text: $username)
//                    .font(.system(size: 28, weight: .semibold, design: .rounded))
//                    .foregroundColor(Color("orange600"))
//                    .onChange(of: username) { newValue in
//                            isUsernameEmpty = newValue.isEmpty
//                        }
//
//                Spacer()
//
//                Button(action: {
//                    if isUsernameEmpty {
//                            // Menampilkan peringatan jika nama kosong
//                            // Atau melakukan tindakan lain sesuai kebutuhan
//                    } else {
//                        currentPage = 5
//                    }
//                }, label: {
//                    Text("Selanjutnya")
//                        .font(.system(size: 17, weight: .semibold, design: .rounded))
//                        .foregroundColor(.white)
//                })
//                .frame(maxWidth: 342, maxHeight: 56)
//                .background(isUsernameEmpty ? Color("orange400") : Color ("orange600"))
//                .cornerRadius(20)
//            }
//            .padding(.horizontal, 20)
//            .padding(.top, 70)
//            .padding(.bottom, 58)
//        }
//    }
//}
//
//struct AgeInputView: View {
//
//    @Binding var currentPage: Int
//    @Binding var username: String
//    @AppStorage("selectedAge") var selectedAge: String = ""
//
//    var background: String
//
//    var body: some View {
//        ZStack {
//            Image (background)
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
//
//            VStack {
//                HStack {
//                    Color("orange400").frame(height: 10 / UIScreen.main.scale)
//                        .cornerRadius(20)
//                    Color("orange600").frame(height: 10 / UIScreen.main.scale)
//                        .cornerRadius(20)
//                }
//
//                Spacer()
//                    .frame(height: 48)
//
//                Text("Berapa umur \(username)?")
//                    .font(.system(size: 28, weight: .bold, design: .rounded))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//
//                Spacer ()
//
//                HStack {
//                    OptionView(option: "Anak", isSelected: selectedAge == "Anak", action: {selectedAge = "Anak"}, rangeAge: "0 - 6 bulan")
//
//                    Spacer()
//                        .frame(width: 16)
//
//                    OptionView(option: "Junior", isSelected: selectedAge == "Junior", action: {selectedAge = "Junior"}, rangeAge: "6 bulan - 3 tahun")
//                }
//
//                Spacer()
//                    .frame(height: 16)
//
//                HStack {
//                    OptionView(option: "Dewasa", isSelected: selectedAge == "Dewasa", action: {selectedAge = "Dewasa"}, rangeAge: "3 - 10 tahun")
//
//                    Spacer()
//                        .frame(width: 16)
//
//                    OptionView(option: "Senior", isSelected: selectedAge == "Senior", action: {selectedAge = "Senior"}, rangeAge: "10+ tahun")
//                }
//
//                Spacer ()
//
//                Button(action: {
//                    UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
//                    currentPage = 1
//                }, label: {
//                    Text("Simpan")
//                        .font(.system(size: 17, weight: .semibold, design: .rounded))
//                        .foregroundColor(.white)
//                })
//                .frame(maxWidth: 342, maxHeight: 56)
//                .background(Color("orange600"))
//                .cornerRadius(20)
//            }
//            .padding(.horizontal, 20)
//            .padding(.top, 70)
//            .padding(.bottom, 58)
//        }
//    }
//}
//
//struct OptionView: View {
//    var option: String
//    var isSelected: Bool
//    var action: () -> Void
//    var rangeAge: String
//
//    var body: some View {
//        Button(action: action) {
//            Circle()
//                .stroke(isSelected ? Color("orange600") : Color("orange400"), lineWidth: isSelected ? 3 : 1)
//                .frame(width: 163, height: 163)
//                .overlay(
//                    VStack {
//                        Text(option)
//                            .font(.system(size: 22, weight: .bold, design: .rounded))
//                            .foregroundColor(.black)
//
//                        Text(rangeAge)
//                            .font(.system(size: 15, weight: .regular, design: .rounded))
//                            .foregroundColor(.black)
//
//                    }
//
//                )
//        }
//    }
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingScreen()
//    }
//}
//
