//
//  LoginPage.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/25.
//

import SwiftUI

struct LoginPage: View {
    @EnvironmentObject var globalViewModel: GlobalViewModel
    @EnvironmentObject var errorHandling: ErrorHandling
    @StateObject var loginViewModel = LoginViewModel()
    
    
    var body: some View {
        VStack {
            Text("WeChat")
                .font(.title)
                .bold()
                .padding(.bottom, 50)
            
            TextField("アカウントID", text: $loginViewModel.form.name)
                .modifier(TextFieldStyle())
                .padding(.bottom, 20)
            
            SecureField("パスワード", text: $loginViewModel.form.password)
                .modifier(TextFieldStyle())
                .padding(.bottom, 50)
            
            Button(action: {
                Task {
                    await loginViewModel.login(errorHandling: self.errorHandling, globalViewModel: self.globalViewModel)
                }
            }, label: {
                Text("ログイン")
                    .modifier(LargeButtonLabelStyle())
            })
            .alert("ログイン失敗", isPresented: $loginViewModel.loginError, actions: {
                Button(action: {}, label: {
                    Text("OK")
                })
            }, message: {
                Text(loginViewModel.loginErrorMessage)
            })
            
            Button(action: {}, label: {
                Text("新規登録")
                    .modifier(LargeSecoundaryButtonLabelStyle())
            })
            .padding(.top, 8)
            
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
        .environmentObject(GlobalViewModel())
        .environmentObject(ErrorHandling())
    }
}
