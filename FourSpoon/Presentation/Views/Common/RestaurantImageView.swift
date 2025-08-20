//
//  RestaurantImageView.swift
//  FourSpoon
//
//  Created by Rimesh Jotaniya on 19/08/25.
//

import SwiftUI

struct RestaurantImageView: View {
    let imageURL: URL

    var body: some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case let .success(image):
                image
                    .resizable()
            case .failure:
                ZStack {
                    Color.gray.opacity(0.3)
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "fork.knife")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Image Unavailable")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(.secondary)
                            Spacer()
                        }
                        Spacer()
                    }
                }
            default:
                ZStack {
                    Color.gray.opacity(0.3)
                    ProgressView()
                        .controlSize(.extraLarge)
                }
            }
        }
        .frame(height: 242)
        .frame(maxWidth: .infinity)
    }
}
