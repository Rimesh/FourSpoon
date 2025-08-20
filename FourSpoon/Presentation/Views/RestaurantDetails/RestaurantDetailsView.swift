//
//  RestaurantDetailsView.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 20/08/25.
//

import SwiftUI

struct RestaurantDetailsView: View {
    @StateObject var viewModel: RestaurantDetailsViewModel

    var body: some View {
        Group {
            if viewModel.isLoading {
                loadingView
            } else {
                if let details = viewModel.restaurantDetails {
                    contentView(details: details)
                } else {
                    errorView
                }
            }
        }
        .task {
            await viewModel.loadRestaurantDetails()
        }
    }

    var loadingView: some View {
        VStack {
            Spacer()
            ProgressView("Getting Restaurant details...")
                .controlSize(.extraLarge)
            Spacer()
        }
    }

    var errorView: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: "exclamationmark.icloud")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.gray)
            Text("Unable to get Restaurant Details, \nPlease try again later..")
                .font(.system(size: 22, weight: .semibold))
                .padding()
            Spacer()
        }
        .padding()
    }

    func contentView(details: RestaurantDetails) -> some View {
        ScrollView {
            VStack {
                RestaurantImageView(imageURL: details.imageURL)
                    .scaledToFill()
                    .frame(height: 312)
                    .background(.gray)
                VStack {
                    HStack {
                        Text(details.name)
                            .font(.system(size: 24, weight: .semibold))
                        if let ratings = details.ratingsAverage {
                            RatingView(averageRating: ratings, variant: .medium)
                        }
                        Spacer()
                    }
                    Text(details.description)
                        .font(.system(size: 15, weight: .medium))
                    VStack {
                        HStack {
                            Image(systemName: "wineglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Serves Alcohol")
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "parkingsign.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Parking Available")
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "person.badge.shield.checkmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Valet Available")
                            Spacer()
                        }
                    }
                    VStack {
                        ForEach(details.labels, id: \.self) { label in
                            HStack {
                                Spacer()
                                Text(label)
                                    .font(.system(size: 12))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(.teal, in: .capsule)
                                Spacer()
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                Spacer()
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}
