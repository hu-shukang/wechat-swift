//
//  Error.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/29.
//

import Foundation

struct ValidateInfo: Codable {
    var property: String
    var message: String
}

struct ResponseError<T: Codable>: Decodable, LocalizedError {
    var error: T
    
    var errorDescription: String? {
        do {
            let data = try JSONEncoder().encode(error)
            let json: String = String(data: data, encoding: .utf8)!
            return json
        } catch {
            return error.localizedDescription
        }
         
    }
}
