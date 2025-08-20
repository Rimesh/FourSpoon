//
//  RestaurantListView.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import SwiftUI

struct RestaurantListView: View {
    @ObservedObject var viewModel: RestaurantListViewModel
    @EnvironmentObject private var router: AppRouter

    var body: some View {
        Group {
            if viewModel.isInitialLoading {
                initialLoadingView
            } else {
                if viewModel.restaurants.isEmpty {
                    emptyListView
                } else {
                    contentView
                }
            }
        }
        .navigationTitle("Restaurants")
        .task { await viewModel.loadRestaurants() }
        .alert(
            "Something went wrong,\n Please try again later...",
            isPresented: $viewModel.showError
        ) {
            HStack {
                Button(action: viewModel.reloadRestaurantList) {
                    Text("Try Again")
                }
                Button("Cancel", role: .cancel) {}
            }
        }
        .refreshable {
            viewModel.reloadRestaurantList()
        }
        .searchable(
            text: $viewModel.searchQuery,
            prompt: "Search Restaurants"
        )
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
                    RestaurantListItemView(restaurant: restaurant)
                        .onTapGesture {
                            router.navigate(to: .restaurantDetails(restaurantId: restaurant.id))
                        }
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

    var emptyListView: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(.cutlery)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.gray)
            Text("No restaurants in your region...\nCheck back later, we are constantly partnering with new restaurants.")
                .font(.system(size: 22, weight: .semibold))
                .padding()
            Spacer()
        }
        .padding()
    }
}
