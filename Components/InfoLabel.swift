//
//  InfoLabel.swift
//  ZuperService
//
//  Created by puvi on 12/03/26.
//

import SwiftUI

struct InfoLabel: View {
    
    let text: String
    let icon: String
    
    var titleFont: Font = .subheadline
    var titleColor: Color = .secondary
    var iconColor: Color = .blue
    
    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            Image(icon)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(iconColor)
                .shadow(color: iconColor.opacity(0.5), radius: 1)
            
            Text(text)
                .font(titleFont)
                .fontWeight(.semibold)
                .foregroundColor(titleColor)
                .multilineTextAlignment(.leading)
        }
    }
}
