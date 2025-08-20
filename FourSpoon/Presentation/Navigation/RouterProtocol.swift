//
//  RouterProtocol.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 20/08/25.
//

import Foundation

@MainActor
protocol RouterProtocol: ObservableObject {
    var path: [AppRoute] { get set }

    func navigate(to route: AppRoute)
    func navigateBack()
    func navigateToRoot()
}
