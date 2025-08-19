//
//  RestaurantListView.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import SwiftUI

struct RestaurantListView: View {
    @StateObject var viewModel: RestaurantListViewModel

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isInitialLoading {
                    initialLoadingView
                } else {
                    contentView
                }
            }
            .navigationTitle("Restaurants")
        }
        .task {
            await viewModel.loadRestaurants()
        }
    }

    var initialLoadingView: some View {
        VStack {
            Spacer()
            ProgressView("Getting restaurants in your region..")
                .controlSize(.large)
            Spacer()
        }
        .padding()
    }

    var contentView: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.restaurants.enumerated(), id: \.0) { index, restaurant in
                    Text(restaurant.name)
                        .onAppear {
                            // Load more, when showing last item in the list
                            if index == viewModel.restaurants.count - 1 {
                                Task { await viewModel.loadMoreRestaurants() }
                            }
                        }
                }
                if viewModel.isLoadingMoreData {
                    ProgressView("Loading more...")
                }
            }
            .padding()
        }
    }
}
