//
//  Error.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/29.
//

import Foundation

struct ValidateInfo: Decodable {
    var property: String
    var message: String
}

struct ResponseError<T: Decodable>: Decodable {
  var error: T
}
