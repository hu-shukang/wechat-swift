//
//  ContentView.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var globalViewModel: GlobalViewModel

    
    var body: some View {
        NavigationView {
            if globalViewModel.loginStatus {
                HomePage()
            } else {
                LoginPage()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GlobalViewModel())
    }
}
