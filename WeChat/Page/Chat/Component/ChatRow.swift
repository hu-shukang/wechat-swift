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
    
    var body: some View {
        HStack {
            KFImage(URL(string: chat.user.avator)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack {
                HStack{
                    Text(chat.user.name)
                    Spacer()
                    Text(chat.latestMessageTime)
                }
            }
        }
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        let user: UserModel = UserModel(id: "100", name: "こしょこう", avator: "https://images.unsplash.com/photo-1430990480609-2bf7c02a6b1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZnJlZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60")
        let messageList: [MessageModel] = [
            MessageModel(id: "200", from: "100", to: "200", timestamp: 1655625207)
        ]
        let chat: ChatModel = ChatModel(user: user, unread: false, messageList: messageList)
        return ChatRow(chat: chat)
    }
}
