//
//  HomeViewModel.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/26.
//

import Foundation

class HomeViewModel: ObservableObject {
    let titleDic = ["chat": "WeChat", "addressBook": "連絡先", "find": "発見", "me": "自分"]
    let toolBarImageDic = ["chat": "plus.circle", "addressBook": "person.badge.plus"]
    
    @Published var activeTab: String = "chat"
    
    var title: String {
        titleDic[activeTab]!
    }
    
    var toolBarImage: String? {
        toolBarImageDic[activeTab]
    }
    
}
