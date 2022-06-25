//
//  HomePage.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/25.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var globalViewModel: GlobalViewModel
    
    
    var body: some View {
        VStack {
            Text("Home Page")
            Button(action: {
                globalViewModel.logout()
            }, label: {
                Text("Logout")
                    .modifier(LargeButtonLabelStyle())
            })
        }
        .padding()
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .environmentObject(GlobalViewModel())
    }
}
