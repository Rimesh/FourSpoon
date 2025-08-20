//
//  AppRoute.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 20/08/25.
//

import Foundation

enum AppRoute: Hashable {
    case restaurantList
    case restaurantDetails(restaurantId: UUID)
}
