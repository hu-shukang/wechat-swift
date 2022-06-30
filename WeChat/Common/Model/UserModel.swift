//
//  UserModel.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/26.
//

import Foundation

struct UserModel: Identifiable, Decodable {
    var id: String
    var name: String
    var avator: String
}

struct LoginForm: Codable {
    var name: String
    var password: String
}

struct LoginResponse: Decodable {
    var token: String
}
