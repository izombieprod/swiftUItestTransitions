//
//  Coordinator.swift
//  testTransitions
//
//  Created by Roman Chervonyak on 20.12.2023.
//

import Foundation

enum CoordinatorStep: String {
    case firstView
    case secondView
    case thirdDView
}

class Coordinator: ObservableObject {
    static let shared = Coordinator()
    
    @Published var steps = [ScreenModel]()
    
    private init() {
        
    }
    
    func showNextScreen(_ screenModel: ScreenModel) {
        steps.append(screenModel)
    }
    
    func goBack() {
        steps.removeLast()
    }
    
    func popToRoot() {
        steps = [.init(title: "Login", type: .firstView)]
    }
}

class ScreenModel: Identifiable, Hashable {
    static func == (lhs: ScreenModel, rhs: ScreenModel) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: String {
        type.id
    }
    
    let title: String
    let type: CoordinatorStep
    
    let navigationBarVisible = false
    
    init(title: String, type: CoordinatorStep) {
        self.title = title
        self.type = type
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension CoordinatorStep: Identifiable {
    var id: String {
        self.rawValue
    }
}
