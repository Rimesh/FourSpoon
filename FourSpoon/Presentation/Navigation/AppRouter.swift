//
//  AppRouter.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 20/08/25.
//

import Combine
import SwiftUI

@MainActor
class AppRouter: RouterProtocol, ObservableObject {
    @Published var path: [AppRoute] = []

    func navigate(to route: AppRoute) {
        path.append(route)
    }

    func navigateBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func navigateToRoot() {
        path.removeAll()
    }
}
