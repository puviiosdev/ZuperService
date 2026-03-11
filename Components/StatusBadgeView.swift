//
//  StatusBadgeView.swift
//  ZuperService
//
//  Created by puvi on 12/03/26.
//

import SwiftUI
import ServicesSampleData


struct StatusBadgeView: View {

    let status: ServiceStatus

    var color: Color {
        switch status {
        case .active: return .green
        case .scheduled: return .blue
        case .completed: return .gray
        case .inProgress: return .orange
        case .urgent: return .red
        }
    }
    
  

    var body: some View {
        
       
        HStack(spacing:5){
            
            RoundedRectangle(cornerRadius: 2)
                 .fill(color.opacity(0.25))
                 .frame(width: 12, height: 12)
            Text(status.rawValue)
    
        }
        .font(.caption)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(color.opacity(0.15))
        .foregroundColor(color)
        .clipShape(.capsule)
 
    }
}
