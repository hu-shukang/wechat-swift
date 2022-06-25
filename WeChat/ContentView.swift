//
//  ContentView.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var globalViewModel = GlobalViewModel()
    @AppStorage("login_status") var loginStatus: Bool = false
    
    var body: some View {
        NavigationView {
            if loginStatus {
                HomePage()
            } else {
                LoginPage()
            }
        }
        .environmentObject(globalViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
