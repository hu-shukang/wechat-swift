//
//  GlobalViewModel.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/25.
//

import Foundation
import SwiftUI

class GlobalViewModel: ObservableObject {
    @AppStorage("login_status") var loginStatus: Bool = false
    
    func logout() {
        loginStatus = false
    }
}
