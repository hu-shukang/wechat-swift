//
//  ChatPage.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/26.
//

import SwiftUI

struct ChatPage: View {
    @EnvironmentObject var globalViewModel: GlobalViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                Divider()
                ForEach(globalViewModel.chatList) { chat in
                    VStack {
                        NavigationLink(destination: {
                            Text("123")
                        }) {
                            ChatRow(chat: chat)
                                .padding(.vertical, 7)
                        }
                        Divider()
                    }
                    .id(chat.id)
                }
            }
        }
        .padding(.horizontal, 14)
    }
}

struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomePage()
                .environmentObject(GlobalViewModel())
        }
    }
}
