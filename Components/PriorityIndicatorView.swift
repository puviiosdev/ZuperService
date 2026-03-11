//
//  PriorityIndicatorView.swift
//  ZuperService
//
//  Created by puvi on 12/03/26.
//

import SwiftUI
import ServicesSampleData


struct PriorityIndicatorView: View {

    let priority: Priority

    var color: Color {

        switch priority {
        case .low:
            return .green
        case .medium:
            return .yellow
        case .high:
            return .orange
        case .critical:
            return .red
        }
    }

    var body: some View {

        Circle()
            .fill(color)
            .frame(width: 10, height: 10)
    }
}
