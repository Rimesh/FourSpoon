//
//  RouterView.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 20/08/25.
//

import SwiftUI

struct RouterView<Router: RouterProtocol>: View {
    @StateObject private var router: Router
    private let dependencyContainer: DependencyContainer

    init(router: Router, dependencyContainer: DependencyContainer = .shared) {
        _router = StateObject(wrappedValue: router)
        self.dependencyContainer = dependencyContainer
    }

    var body: some View {
        NavigationStack(path: $router.path) {
            destinationView(for: .restaurantList)
                .navigationDestination(for: AppRoute.self) { route in
                    destinationView(for: route)
                }
        }
        .environmentObject(router)
    }

    @ViewBuilder
    private func destinationView(for route: AppRoute) -> some View {
        switch route {
        case .restaurantList:
            RestaurantListView(viewModel: dependencyContainer.restaurantListViewModel)

        case let .restaurantDetails(restaurantId):
            let viewModel = dependencyContainer.makeRestaurantDetailsViewModel(restaurantId: restaurantId)
            RestaurantDetailsView(viewModel: viewModel)
        }
    }
}
