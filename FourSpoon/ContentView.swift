//
//  ContentView.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var restaurants: [RestaurantListItem] = []

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(restaurants, id: \.id) { restaurant in
                        Text(restaurant.name)
                    }
                }.padding()
            }
            .navigationTitle("Restaurants")
        }
        .task {
            await loadRestaurantsFromApiClient()
        }
    }

    func loadRestaurantsFromApiClient() async {
        let restaurantRepository = RestaurantRepository(
            apiClient: APIClient(),
            apiConfiguration: RestaurantAPIConfiguration()
        )
        do {
            let restaurants = try await restaurantRepository.getRestaurants(regionId: nil, page: 0)
            self.restaurants = restaurants.data.map { $0.toDomain() }
        } catch {
            print("Error: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
