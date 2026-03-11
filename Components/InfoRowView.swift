//
//  InfoRowView.swift
//  ZuperService
//
//  Created by puvi on 12/03/26.
//

import SwiftUI


struct InfoRowView: View {

    let icon: String
    let title: String
    let description: String

    var body: some View {

        VStack(alignment: .leading, spacing: 3) {

            InfoLabel(
                text: title,
                icon: icon,
                titleFont: .subheadline,
                titleColor: .black,
                iconColor: .blue
            )

            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.leading, 28)
        }
    }
}
