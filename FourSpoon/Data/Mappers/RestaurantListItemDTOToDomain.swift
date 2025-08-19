//
//  RestaurantListItemDTOToDomain.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

extension RestaurantListItemDTO {
    func toDomain() -> RestaurantListItem {
        .init(
            id: id,
            name: attributes.name,
            priceLevel: RestaurantListItem.PriceLevel(rawValue: attributes.priceLevel) ?? .unknown,
            phoneNumber: attributes.phone,
            menuURL: attributes.menuURL,
            cuisine: attributes.cuisine,
            imageURL: attributes.imageURL,
            latitude: attributes.latitude,
            longitude: attributes.longitude,
            streetAddress: attributes.addressLine1,
            ratingsAverage: attributes.ratingsAverage,
            ratingsCount: attributes.ratingsCount,
            labels: attributes.labels
        )
    }
}
