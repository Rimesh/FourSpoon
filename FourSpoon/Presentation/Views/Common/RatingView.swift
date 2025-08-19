//
//  RatingView.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import SwiftUI

struct RatingView: View {
    let averageRating: String
    let variant: Variant

    var body: some View {
        HStack(spacing: 2) {
            Image(.star)
                .resizable()
                .scaledToFit()
                .frame(width: iconSize, height: iconSize)
            Text(averageRating)
                .font(.system(size: textSize, weight: .semibold))
        }
    }

    var iconSize: Double {
        switch variant {
        case .small: 20
        case .medium: 24
        }
    }

    var textSize: Double {
        switch variant {
        case .small: 13
        case .medium: 16
        }
    }

    enum Variant {
        case small
        case medium
    }
}
