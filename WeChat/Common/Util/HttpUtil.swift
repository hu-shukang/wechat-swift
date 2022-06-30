//
//  HttpUtil.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/30.
//

import Foundation
import AnyCodable

enum HttpMethod: String {
    case GET = "GEY"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}


class HttpUtil {
    public func get<R: Decodable>(url: String, onOk: @escaping (R) -> Void) {
        self.request(url: url, method: HttpMethod.GET, body: nil, onOk: onOk) { validateInfoList in
            print(validateInfoList)
        } onAuthError: { error in
            print(error)
        } onError: { error in
            print(error)
        }
    }
    
    public func post<R: Decodable>(url: String, body: AnyEncodable, onOk: @escaping (R) -> Void, onValidateError: @escaping ([ValidateInfo]) -> Void) {
        self.request(url: url, method: HttpMethod.POST, body: body, onOk: onOk, onValidateError: onValidateError) { error in
            print(error)
        } onError: { error in
            print(error)
        }
    }
    
    private func request<R: Decodable>(url: String, method: HttpMethod, body: AnyEncodable?, onOk: @escaping (R) -> Void, onValidateError: @escaping ([ValidateInfo]) -> Void, onAuthError: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if body != nil {
            let httpBody = try! JSONEncoder().encode(body)
            request.httpBody = httpBody
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        URLSession.shared.dataTask(with: request, completionHandler: { data, res, err in
            do {
                let response = res as! HTTPURLResponse
                let status = response.statusCode
                if status == 200 {
                    guard let data = data else {
                        return
                    }
                    let loginResponse = try JSONDecoder().decode(R.self, from: data)
                    onOk(loginResponse)
                } else if status == 400 {
                    guard let data = data else {
                        return
                    }
                    let validateErrors = try JSONDecoder().decode(ResponseError<[ValidateInfo]>.self, from: data)
                    onValidateError(validateErrors.error)
                } else if status == 401 {
                    guard let data = data else {
                        return
                    }
                    let error = try JSONDecoder().decode(ResponseError<String>.self, from: data)
                    onAuthError(error.error)
                } else if status == 500 {
                    guard let data = data else {
                        return
                    }
                    let error = try JSONDecoder().decode(ResponseError<String>.self, from: data)
                    onError(error.error)
                }
            } catch (let error) {
                onError(error.localizedDescription)
            }
        }).resume()
    }
}
