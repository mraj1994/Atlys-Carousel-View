//
//  IndicatorView.swift
//  Atlys-iOS Assignment
//
//  Created by Madhvendra raj singh on 09/07/25.
//

import SwiftUI

struct IndicatorView: View {
    let ImageIndex: Int
    let scrollId: Int?
    var body: some View {
        let scrollId = scrollId ?? 0
        HStack {
            ForEach(0..<ImageIndex, id: \.self) { index in
                Image(systemName: "circle.fill")
                    .font(.system(size: 10))
                    .foregroundStyle(scrollId == index ? .white : .gray)
            }
        }
        .padding(6)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.lightGray)).opacity(0.6))
    }
}

#Preview {
    IndicatorView(ImageIndex: 3, scrollId: 2)
}
