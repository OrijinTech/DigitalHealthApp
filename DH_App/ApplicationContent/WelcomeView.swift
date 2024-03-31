//
//  ContentView.swift
//  DH_App
//
//  Created by Yongxiang Jin on 3/10/24.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject var viewModel = MenuViewModel()
    @State private var selectedTab = 0
    
    let tabData: [(imageName: String, title: LocalizedStringKey, description: LocalizedStringKey)] = [
            ("fitness", "Welcome to Digital Health", "Have you thought of efficiently recording your daily habits? Did you drink enough water? Or did you eat healthy enough?"),
            ("healthy_food", "Digitalizing your Diet", "Record your dietary information in case that you need advice from an expert."),
            ("water_glass", "Correct Water Intake", "Even when drinking water, there is a correct and scientific way.")]
            
    
    var body: some View {
        Group {
            if viewModel.showLoadingScreen {
                LoadingScreenView(viewModel: viewModel)
            } else {
                if viewModel.userSession != nil {
                    MainMenuView()
                } else {
                    welcomeView
                }
            }
        }
    }
    
    
    var welcomeView: some View {
        NavigationStack {
            VStack {
                Image("logo_black_t")
                    .resizable().scaledToFill()
                    .frame(width: 120, height: 120)
                
                TabView {
                    ForEach(0 ..< tabData.count) { index in
                        VStack {
                            Image(tabData[index].imageName)
                                .resizable().scaledToFill()
                                .frame(width: 300, height: 300)
                            
                            Text(tabData[index].title)
                                .font(.system(size: 17, weight: .light, design: .rounded))
                            
                            Text(tabData[index].description)
                                .font(.system(size: 17, weight: .light, design: .rounded))
                                .padding(.horizontal, 50)
                                .padding(.top, 10)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                .padding(.top, -80)
                .tabViewStyle(PageTabViewStyle())
                .onAppear{
                    setupTab()
                }
                
                NavigationLink {
                    RegistrationView()
                        
                } label: {
                    Text("Join us for FREE")
                }
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 250, height: 45)
                .background(.brand)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.vertical)
                
                
                HStack {
                    Text("Already have an account")
                    NavigationLink {
                        SignInView()
                    } label: {
                        Text("Sign in")
                            .foregroundStyle(.brand)
                    }
                }
                .padding(.bottom, 20)
                
                Spacer()
            }
        }// End of Navigation Stack
    }
    
    
    func setupTab() {
      UIPageControl.appearance().currentPageIndicatorTintColor = .black
      UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
}

#Preview() {
    WelcomeView()
}


