//
//  MessagePage.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/27.
//

import SwiftUI

struct MessagePage: View {
    let chat: ChatModel
    @StateObject var messageViewModel = MessageViewModel()
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach(chat.messageList) { message in
                        MessageRow(message: message, user: chat.user)
                            .padding(.bottom, 10)
                            .id(message.id)
                    }
                }
                .onAppear(perform: {
                    guard let id = chat.messageList.last?.id else {
                        return
                    }
                    proxy.scrollTo(id, anchor: .bottom)
                })
            }
            HStack {
                TextField("メッセージ", text: $messageViewModel.text)
                    .modifier(TextFieldStyle())
                Button(action: {}, label: {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                })
                .padding(.leading, 5)
            }
        }
        .padding(14)
        .navigationTitle(chat.user.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.bgColor)
    }
}

struct MessagePage_Previews: PreviewProvider {
    static var previews: some View {
        let user: UserModel = UserModel(id: "100", name: "こしょこう", avator: "https://images.unsplash.com/photo-1430990480609-2bf7c02a6b1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZnJlZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60")
        let messageList: [MessageModel] = [
            MessageModel(id: "200", from: "100", to: "200", message: "こんにちは、こんにちは、こんにちは、こんにちは、", timestamp: 1655625207),
            MessageModel(id: "201", from: "200", to: "200", message: "こんにちは、こんにちは、こんにちは、こんにちは、", timestamp: 1655625207),
            MessageModel(id: "202", from: "100", to: "200", message: "こんにちは、こんにちは、こんにちは、こんにちは、", timestamp: 1655625207),
            MessageModel(id: "203", from: "200", to: "200", message: "こんにちは、こんにちは、こんにちは、こんにちは、", timestamp: 1655625207),
            MessageModel(id: "204", from: "100", to: "200", message: "こんにちは、こんにちは、こんにちは、こんにちは、", timestamp: 1655625207),
            MessageModel(id: "205", from: "200", to: "200", message: "こんにちは、こんにちは、こんにちは、こんにちは、", timestamp: 1655625207),
            MessageModel(id: "206", from: "100", to: "200", message: "こんにちは、こんにちは、こんにちは、こんにちは、", timestamp: 1655625207),
            MessageModel(id: "207", from: "200", to: "200", message: "こんにちは、こんにちは、こんにちは、こんにちは、", timestamp: 1655625207),
            MessageModel(id: "208", from: "100", to: "200", message: "こんにちは、こんにちは、こんにちは、こんにちは、", timestamp: 1655625207),
            MessageModel(id: "209", from: "200", to: "200", message: "こんにちは、こんにちは、こんにちは、こんにちは、", timestamp: 1655625207),
            MessageModel(id: "210", from: "100", to: "200", message: "こんにちは、こんにちは、こんにちは、こんにちは、", timestamp: 1655625207)
        ]
        let chat: ChatModel = ChatModel(user: user, unread: false, messageList: messageList)
        return NavigationView {
            MessagePage(chat: chat)
        }
            
    }
}
