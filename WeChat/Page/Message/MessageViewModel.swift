//
//  MessageViewModel.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/27.
//

import Foundation

class MessageViewModel: ObservableObject {
    @Published var text: String = ""
    
    func sendMessage(user: UserModel) -> MessageModel {
        let id = UUID().uuidString
        let timestamp = Int(Date().timeIntervalSince1970)
        let message = text
        text = ""
        return MessageModel(id: id, from: "me", to: user.name, message: message, timestamp: timestamp)
    }
}
