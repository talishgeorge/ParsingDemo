//
//  HomeViewModel.swift
//  ParsingDoc
//
//  Created by Talish George on 21/6/22.
//

import Foundation

final class HomeViewModel {
    
    let title = "Home"
    var coordinator: HomeCoordinator?
    
    func viewDidDisappear() {
        coordinator?.didFinishHomeCoordinator()
    }
}
