//
//  ChatRow.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/26.
//

import SwiftUI
import Kingfisher

struct ChatRow: View {
    let chat: ChatModel
    let size: CGFloat = 50
    
    var body: some View {
        HStack(alignment: .top) {
            Avator(url: chat.user.avator, size: self.size)
            
            VStack(alignment: .leading) {
                HStack{
                    Text(chat.user.name)
                        .foregroundColor(.black)
                    Spacer()
                    Text(chat.latestMessageTime)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                Spacer()
                if chat.lastestMessage != nil {
                    Text(chat.lastestMessage!)
                        .lineLimit(1)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
            }
        }
        .frame(height: size)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        let user: UserModel = UserModel(id: "100", name: "こしょこう", avator: "https://images.unsplash.com/photo-1430990480609-2bf7c02a6b1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZnJlZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60")
        let messageList: [MessageModel] = [
            MessageModel(id: "200", from: "100", to: "200", message: "こんにちは、こんにちは、こんにちは、こんにちは、", timestamp: 1655625207)
        ]
        let chat: ChatModel = ChatModel(user: user, unread: false, messageList: messageList)
        return ChatRow(chat: chat)
    }
}
