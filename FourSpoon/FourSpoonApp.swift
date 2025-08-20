//
//  FourSpoonApp.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import SwiftUI

@main
struct FourSpoonApp: App {
    var body: some Scene {
        WindowGroup {
            let networkService = NetworkService(baseURL: "https://api.eat-sandbox.co/consumer/v2")
            let restaurantRepository = RestaurantRepository(networkService: networkService)

            let getRestaurantListUseCase = GetRestaurantListUseCase(repository: restaurantRepository)
            let getRestaurantDetailsUseCase = GetRestaurantDetailsUseCase(repository: restaurantRepository)

//            let restaurantListViewModel = RestaurantListViewModel(getRestaurantsUseCase: getRestaurantListUseCase)
//            RestaurantListView(viewModel: restaurantListViewModel)

            let restaurantDetailsViewModel = RestaurantDetailsViewModel(getRestaurantDetailsUseCase: getRestaurantDetailsUseCase)
            RestaurantDetailsView(viewModel: restaurantDetailsViewModel)
        }
    }
}
