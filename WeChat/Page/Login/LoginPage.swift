//
//  LoginPage.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/25.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginViewModel = LoginViewModel();
    var body: some View {
        VStack {
            Text("WeChat")
                .font(.title)
                .bold()
                .padding(.bottom, 50)
            
            TextField("アカウントID", text: $loginViewModel.accountId)
                .modifier(TextFieldStyle())
                .padding(.bottom, 20)
            
            SecureField("パスワード", text: $loginViewModel.password)
                .modifier(TextFieldStyle())
                .padding(.bottom, 50)
            
            Button(action: {
                loginViewModel.login()
            }, label: {
                Text("ログイン")
                    .modifier(LargeButtonLabelStyle())
            })
            .alert("ログイン失敗", isPresented: $loginViewModel.loginError, actions: {
                Button(action: {}, label: {
                    Text("OK")
                })
            }, message: {
                Text("アカウントIDやパスワードは不正です")
            })
            
        }
        .padding()
        .navigationBarHidden(true)
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginPage()
        }
    }
}
