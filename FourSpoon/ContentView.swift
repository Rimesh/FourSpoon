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
        let restaurantRepository = RestaurantRepository(networkService: NetworkService(baseURL: "https://api.eat-sandbox.co/consumer/v2"))
        do {
            let response = try await restaurantRepository.getRestaurants(regionId: nil, page: 0)
            restaurants = response.data
        } catch {
            print("Error: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
