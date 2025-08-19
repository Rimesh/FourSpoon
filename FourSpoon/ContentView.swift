//
//  ContentView.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var restaurants: [RestaurantDTO] = []

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(restaurants, id: \.id) { restaurant in
                        Text(restaurant.attributes.name)
                    }
                }.padding()
            }
            .navigationTitle("Restaurants")
        }
        .task {
            await loadRestaurants()
        }
    }

    func loadRestaurants() async {
        let url = URL(string: "https://api.eat-sandbox.co/consumer/v2/restaurants?region_id=3906535a-d96c-47cf-99b0-009fc9e038e0")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let restaurants = try JSONDecoder().decode(RestaurantListResponse.self, from: data)
            self.restaurants = restaurants.data
        } catch {
            print("Error fetching restaurants: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
