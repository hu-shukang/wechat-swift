//
//  Extensions.swift
//  WeChat
//
//  Created by 胡书康 on 2022/06/25.
//

import Foundation
import SwiftUI

extension Color {
    static var inputBG = Color.black.opacity(0.05)
    static var primaryColor = Color("primaryColor")
    static var bgColor = Color("bgColor")
}

extension View {
    func withErrorHandling() -> some View {
        modifier(HandleErrorByShowingAlertViewModifier())
    }
}


extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
