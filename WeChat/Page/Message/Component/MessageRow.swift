//
//  MessageRow.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/27.
//

import SwiftUI

struct MessageRow: View {
    var message: MessageModel
    var user: UserModel
    let width: CGFloat = UIScreen.main.bounds.width * 0.6
    let size: CGFloat = 40
    
    var isSender: Bool {
        user.id != message.from
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                if !isSender {
                    Avator(url: user.avator, size: self.size)
                }
                Text(message.message)
                    .frame(maxWidth: width)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(isSender ? Color.primaryColor.opacity(0.5) : .white)
                    )
                
                if isSender {
                    Avator(url: user.avator, size: self.size)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: isSender ? .trailing : .leading)
    }
}

struct MessageRow_Previews: PreviewProvider {
    static let message = MessageModel(id: "200", from: "100", to: "200", message: "こんにちは、こんにちは、こんにちは、こんにちは、", timestamp: 1655625207)
    static let user: UserModel = UserModel(id: "100", name: "こしょこう", avator: "https://images.unsplash.com/photo-1430990480609-2bf7c02a6b1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZnJlZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60")
    
    static var previews: some View {
        MessageRow(message: message, user: user)
    }
}
