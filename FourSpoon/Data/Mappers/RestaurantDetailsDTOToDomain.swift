//
//  RestaurantDetailsDTOToDomain.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 20/08/25.
//

extension RestaurantDetailsDTO {
    func toDomain() -> RestaurantDetails {
        .init(
            id: id,
            name: attributes.name,
            priceLevel: PriceLevel(rawValue: attributes.priceLevel),
            phoneNumber: attributes.phone,
            menuURL: attributes.menuURL,
            cuisine: attributes.cuisine,
            imageURL: attributes.imageURL,
            latitude: attributes.latitude,
            longitude: attributes.longitude,
            streetAddress: attributes.addressLine1,
            ratingsAverage: attributes.ratingsAverage,
            ratingsCount: attributes.ratingsCount,
            labels: attributes.labels,
            alcohol: attributes.alcohol,
            smoking: attributes.smoking,
            valet: attributes.valet,
            description: attributes.description,
            externalRatingsURL: attributes.externalRatingsURL,
            imageURLs: attributes.imageURLs
        )
    }
}
