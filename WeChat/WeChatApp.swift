//
//  WeChatApp.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/25.
//

import SwiftUI

@main
struct WeChatApp: App {
    @StateObject var globalViewModel = GlobalViewModel()
    
    init() {
        globalViewModel.logout()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(globalViewModel)
        }
    }
}
