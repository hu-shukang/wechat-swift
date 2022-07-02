//
//  ErrorHandling.swift
//  WeChat
//
//  Created by 胡书康 on 2022/07/02.
//

import Foundation
import SwiftUI

class ErrorHandling: ObservableObject {
    @Published var message: String = ""
    @Published var showMessage: Bool = false
    
    func handle(error: Error) {
        DispatchQueue.main.async {
            self.showMessage = true
            self.message = error.localizedDescription
        }
    }
}

struct HandleErrorByShowingAlertViewModifier: ViewModifier {
    @StateObject var errorHandling = ErrorHandling()
    
    func body(content: Content) -> some View {
        content
            .environmentObject(errorHandling)
            .background(
                EmptyView()
                    .alert("Error", isPresented: $errorHandling.showMessage, actions: {
                        Button(action: {}, label: {Text("OK")})
                    }, message: {
                        Text(errorHandling.message)
                    })
            )
    }
}
