//
//  ChatModel.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/26.
//

import Foundation

struct MessageModel: Identifiable, Decodable {
    var id: String
    var from: String
    var to: String
    var message: String
    var timestamp: Int
}

struct ChatModel: Identifiable, Decodable {
    var user: UserModel
    var unread: Bool
    var messageList: [MessageModel]
    
    var id: String {
        user.id
    }
    
    var latestMessageTime: String {
        guard let timestamp = messageList.last?.timestamp else {
            return ""
        }
        return DateUtil.instance.formatTime(unix: timestamp)
    }
    
    var latestMessageTimestamp: Int? {
        return messageList.last?.timestamp
    }
    
    var lastestMessage: String? {
        return messageList.last?.message
    }
}
