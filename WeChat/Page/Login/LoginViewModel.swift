//
//  LoginViewModel.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/25.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var form: LoginForm = LoginForm(name: "", password: "")
    @Published var loginError: Bool = false
    @Published var loginErrorMessage: String = ""
    
    @AppStorage("token") var token: String = ""
    
    let loginUrl = "https://i83697f6wa.execute-api.ap-northeast-1.amazonaws.com/Dev/user/login"
    
    func login() {
//        guard let url = URL(string: loginUrl) else {
//            return
//        }
//        let body = try! JSONEncoder().encode(form)
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = body
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        URLSession.shared.dataTask(with: request, completionHandler: { data, res, err in
//            do {
//                let response = res as! HTTPURLResponse
//                let status = response.statusCode
//                if let data = data {
//                    if status == 200 {
//                        let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
//                        DispatchQueue.main.async {
//                            self.loginError = false
//                            self.loginErrorMessage = ""
//                            self.token = loginResponse.token
//                        }
//                    } else if status == 400 {
//                        let validateErrors = try JSONDecoder().decode(ResponseError<[ValidateInfo]>.self, from: data)
//                        print(validateErrors)
//                    } else if status == 401 {
//                        let error = try JSONDecoder().decode(ResponseError<String>.self, from: data)
//                        DispatchQueue.main.async {
//                            self.loginError = true
//                            self.loginErrorMessage = error.error
//                        }
//                    }
//                }
//            } catch (let error) {
//                print(error.localizedDescription)
//                DispatchQueue.main.async {
//                    self.loginError = false
//                }
//            }
//        }).resume()
    }
}
