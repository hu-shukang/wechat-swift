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
    
    @Published var chatList: [ChatModel] = []
    
    init() {
        chatList = loadData()
        chatList = chatList.sorted(by: {a, b in
            guard let aTime = a.latestMessageTimestamp else {
                return false
            }
            guard let bTime = b.latestMessageTimestamp else {
                return true
            }
            return aTime > bTime
        })
    }
    
    func logout() {
        loginStatus = false
    }
    
    func loadData() -> [ChatModel] {
        let data: Data
        guard let file = Bundle.main.url(forResource: "TestData", withExtension: "json") else {
            fatalError("Couldn't find file in main bundle")
        }
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load file from main bundle:\(error)")
        }
        
        do {
            return try JSONDecoder().decode([ChatModel].self, from: data)
        } catch {
            fatalError("Couldn't parse content:\(error)")
        }
    }
}
