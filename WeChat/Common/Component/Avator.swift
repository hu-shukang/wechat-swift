//
//  Avator.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/27.
//

import SwiftUI
import Kingfisher

struct Avator: View {
    var url: String
    var size: CGFloat = 50
    
    var cornerRadius: CGFloat {
        size / 8
    }
    
    var body: some View {
        KFImage(URL(string: url)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

struct Avator_Previews: PreviewProvider {
    static let url = "https://images.unsplash.com/photo-1430990480609-2bf7c02a6b1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZnJlZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
    static var previews: some View {
        Avator(url: url)
    }
}
