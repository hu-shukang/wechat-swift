//
//  HomePage.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/25.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var globalViewModel: GlobalViewModel
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $homeViewModel.activeTab) {
                Text("チャット")
                    .tag("chat")
                    .tabItem {
                        Label("チャット", systemImage: "message.fill")
                    }
                Text("連絡先")
                    .tag("addressBook")
                    .tabItem {
                        Label("連絡先", systemImage: "person.text.rectangle")
                    }
                Text("発見")
                    .tag("find")
                    .tabItem {
                        Label("発見", systemImage: "magnifyingglass.circle.fill")
                    }
                Text("自分")
                    .tag("me")
                    .tabItem {
                        Label("自分", systemImage: "person.fill")
                    }
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .environmentObject(GlobalViewModel())
    }
}
