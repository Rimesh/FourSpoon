//
//  PriceOverlayView.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 20/08/25.
//

import SwiftUI

struct PriceOverlayView: View {
    let priceLevel: PriceLevel

    var body: some View {
        VStack {
            switch priceLevel {
            case .cheap:
                Text("$")
            case .moderate:
                Text("$$")
            case .expensive:
                Text("$$$")
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(.white, in: .capsule)
    }
}
