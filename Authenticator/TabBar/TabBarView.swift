//
//  TabBarView.swift
//  Authenticator
//
//  Created by Trung Vo on 13/08/2024.
//

import SwiftUI
import TabBarModule

struct TabBarView: View {
        @StateObject private var tabBarSetting = TabBarSettings()
        
        
    var body: some View {
            TabBar(selection: $tabBarSetting.selectedItem, visibility: $tabBarSetting.visibility) {
                    homeView
                    settingView
            }
            .tabBarFill(.regularMaterial)
//            .tabBarMargins(.vertical, 8)
//            .tabBarPadding(.vertical, 8)
            .tabBarPadding(.horizontal, 16)
            .tabBarShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .tabBarShadow(radius: 1, y: 1)
//            .fullScreenCover(isPresented: $showOnboarding, content: {
//                OnboardingView()
//                    .edgesIgnoringSafeArea(.all)
//            })
    }
}

private extension TabBarView {
        var homeView: some View {
                ContentView()
                        .tabItem(TabBarItemE.home.rawValue) {
                                createTabBarItemView(.home)
                        }
                        .environmentObject(tabBarSetting)
        }
        
        var settingView: some View {
                Text("Settings")
                        .tabItem(TabBarItemE.setting.rawValue) {
                                createTabBarItemView(.setting)
                        }
                        .environmentObject(tabBarSetting)
        }
        
        func createTabBarItemView(_ item: TabBarItemE) -> some View {
                VStack(spacing: 2) {
                        Image(uiImage: item.icon)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: item.size.width, height: item.size.height)
                        Text(item.title)
                                .font(.system(.footnote, design: .rounded).weight(tabBarSetting.selectedItem == item.rawValue ? .bold : .medium))
                }
        }
}

#Preview {
    TabBarView()
}
