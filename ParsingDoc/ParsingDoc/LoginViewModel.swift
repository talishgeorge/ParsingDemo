//
//  LoginViewModel.swift
//  ParsingDoc
//
//  Created by Talish George on 21/6/22.
//

import Foundation

final class LoginViewModel {
    
    let title = "Login"
    var coordinator: LoginCoordinator?
    
    func tappedHomeEvent() {
        coordinator?.tappedHomeButton()
    }
}
