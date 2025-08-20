//
//  DependencyContainer.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 20/08/25.
//

import Foundation

class DependencyContainer {
    static let shared = DependencyContainer()

    private init() {}

    lazy var networkService: NetworkService = .init(baseURL: "https://api.eat-sandbox.co/consumer/v2")

    lazy var restaurantRepository: RestaurantRepositoryProtocol = RestaurantRepository(networkService: networkService)

    lazy var getRestaurantListUseCase: GetRestaurantListUseCaseProtocol = GetRestaurantListUseCase(repository: restaurantRepository)

    lazy var getRestaurantDetailsUseCase: GetRestaurantDetailsUseCaseProtocol = GetRestaurantDetailsUseCase(repository: restaurantRepository)

    lazy var restaurantListViewModel: RestaurantListViewModel = .init(getRestaurantsUseCase: getRestaurantListUseCase)

    func makeRestaurantDetailsViewModel(restaurantId: UUID) -> RestaurantDetailsViewModel {
        RestaurantDetailsViewModel(getRestaurantDetailsUseCase: getRestaurantDetailsUseCase, restaurantId: restaurantId)
    }
}
