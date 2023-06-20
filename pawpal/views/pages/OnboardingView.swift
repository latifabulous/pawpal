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
                PawAgeView(currentPage: $currentPage, username: $username, background: "onboarding-5")
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
                        Text("Lewati")
                            .font(.system(size: 17, weight: .regular, design: .rounded))
                            .foregroundColor(Color("orange600"))
                    })
                    .padding(.top, 40)
                }
                

                Text(image)
                    .font(.title)
                Text(title)
                    .font(.title)
                Text(description)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.top, 24)
                Spacer()

                Button(action: {
                    if currentPage < 3 {
                        currentPage += 1
                    } else {
                        currentPage = 4
                    }
                }) {
                    if currentPage == 3 {
                        Text("Mulai")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .foregroundColor(Color("neutral10"))
                            .background(Color("orange600")
                            .cornerRadius(20)
                            .frame(width: 310, height: 56)
                                        )
                    } else {
                        Text("Selanjutnya")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .foregroundColor(Color("neutral10"))
                            .background(Color("orange600")
                            .cornerRadius(20)
                            .frame(width: 310, height: 56)

                        )
                    }
                }
                .padding(.bottom, 56)
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
