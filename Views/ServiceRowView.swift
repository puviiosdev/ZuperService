//
//  ServiceRowView.swift
//  ZuperService
//
//  Created by puvi on 12/03/26.
//



import SwiftUI
import ServicesSampleData

struct ServiceRowView: View {

    let service: Service

    var body: some View {

        VStack(alignment: .leading, spacing: 5) {

            // Title + Priority
            HStack {

                Text(service.title)
                    .font(.headline)
                    .foregroundColor(.primary)

                Spacer()

                PriorityIndicatorView(priority: service.priority)
            }
            
        
            
            InfoLabel(
                text: service.customerName,
                icon: "user-circle",
                titleFont: .caption,
                titleColor: .secondary,
                iconColor: .blue
            )
            
            
            InfoLabel(
                text: service.description,
                icon: "file-description",
                titleFont: .caption,
                titleColor: .secondary,
                iconColor: .blue
            )

  

            HStack {

                StatusBadgeView(status: service.status)

                Spacer()

                Text(
                    DateFormatterHelper.formatDate(
                        service.scheduledDate
                    )
                )
                .font(.caption)
                .foregroundColor(.secondary)
            }
        }
        .padding(12)
        
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.separator), lineWidth: 1)
                )
        )


        .padding(.vertical, 2)
        .padding(.horizontal, 4)
    }
}













