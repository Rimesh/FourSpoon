//
//  RestaurantListItemView.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import SwiftUI

struct RestaurantListItemView: View {
    let restaurant: RestaurantListItem

    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(restaurant.name)
                        .lineLimit(2)
                        .font(.system(size: 22, weight: .semibold))
                    Text(restaurant.streetAddress)
                        .font(.system(size: 13, weight: .semibold))
                }
                Spacer()
                if let avg = restaurant.ratingsAverage {
                    RatingView(
                        averageRating: avg,
                        variant: .small
                    )
                }
            }
            ZStack(alignment: .bottomLeading) {
                RestaurantImageView(imageURL: restaurant.imageURL)
                    .clipShape(.rect(cornerRadius: 36))
                VStack(alignment: .leading) {
                    if let priceLevel = restaurant.priceLevel {
                        PriceOverlayView(priceLevel: priceLevel)
                    }
                    Text(restaurant.cuisine)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(.white, in: .capsule)
                }
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading)
                .padding(.bottom)
            }
        }
        .padding(8)
    }
}

#Preview {
    let item = RestaurantListItem(
        id: .init(),
        name: "Some Restaurant which has long name akdjbd adada",
        priceLevel: .moderate,
        phoneNumber: "+91929299292",
        menuURL: URL(string: "https://ucarecdn.com/829e4bb5-bb3a-4d6a-94b5-e73d71ceaf1b/-/inline/yes/")!,
        cuisine: "Indian",
        imageURL: URL(string: "https://ucarecdn.com/88c794c8-6df9-41c9-b7b6-413dee9ddf45/")!,
        latitude: 25.130623,
        longitude: 55.117375,
        streetAddress: "Atlantis The Palm",
        ratingsAverage: "4.5",
        ratingsCount: 435,
        labels: [
            "Smart Casual",
            "Good for Dinner",
            "Accepts Credit Cards",
            "Accepts Cash",
        ]
    )

    RestaurantListItemView(restaurant: item)
}
