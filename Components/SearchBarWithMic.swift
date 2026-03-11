//
//  SearchBarWithMic.swift
//  ZuperService
//
//  Created by puvi on 12/03/26.
//

import SwiftUI


struct SearchBarWithMic: View {

    @Binding var text: String

    var body: some View {
        HStack {

            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("Search", text: $text)

            Button {
                print("Mic tapped")
            } label: {
                Image(systemName: "mic.fill")
                    .foregroundColor(.gray)
            }

        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
