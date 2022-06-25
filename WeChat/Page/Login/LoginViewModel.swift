//
//  LoginViewModel.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/25.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var accountId: String = ""
    @Published var password: String = ""
    @Published var loginError: Bool = false
    
    func login() {
        let result = accountId == "123" && password == "123"
        loginError = !result
    }
}
