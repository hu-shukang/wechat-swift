//
//  LoginViewModel.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/25.
//

import Foundation
import SwiftUI
import AsyncHTTPClient

class LoginViewModel: ObservableObject {
    @Published var form: LoginForm = LoginForm(name: "", password: "")
    @Published var loginError: Bool = false
    @Published var loginErrorMessage: String = ""
    
    @AppStorage("token") var token: String = ""
    
    let loginUrl = "https://wpaa20qki0.execute-api.ap-northeast-1.amazonaws.com/Dev/user/login"
    
    func login(errorHandling: ErrorHandling) async {
        let httpClient = HTTPClient(eventLoopGroupProvider: .createNew)
        do {
            let requestBody = try JSONEncoder().encode(form)
            var request = HTTPClientRequest(url: loginUrl)
            request.method = .POST
            request.body = .bytes(requestBody)
            let response = try await httpClient.execute(request, timeout: .seconds(30))
            let body = try await response.body.collect(upTo: 1024 * 1024)
            if response.status == .ok {
                print("OK")
            } else if response.status == .badRequest {
                let err = try JSONDecoder().decode(ResponseError<[ValidateInfo]>.self, from: body)
                errorHandling.handle(error: err)
            } else {
                let err = try JSONDecoder().decode(ResponseError<String>.self, from: body)
                errorHandling.handle(error: err)
            }
        } catch {
            errorHandling.handle(error: error)
        }
        do {
            try await httpClient.shutdown()
        } catch {
            errorHandling.handle(error: error)
        }
    }
}
