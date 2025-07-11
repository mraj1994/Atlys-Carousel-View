//
//  CarousalView.swift
//  Atlys-iOS Assignment
//
//  Created by Madhvendra raj singh on 09/07/25.
//

import SwiftUI

struct CarouselView: View {
    let images: [String]
    @State private var scrollId: Int?
    
    var body: some View {
        VStack(spacing: .zero) {
            carouselScrollView
            //bottom indicator view
            IndicatorView(ImageIndex: images.count, scrollId: scrollId)
        }
        .scrollPosition(id: $scrollId)
        .onAppear {
            scrollId = images.count / 2 //to show center image (if images count is even it will take the + 1 from the center)
        }
    }
    
    
    private var carouselScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {  //this spacing should be handled separately for bigger screen device like iPAD
                ForEach(0..<images.count, id: \.self) { index in
                    let image = images [index]
                    Image(image)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(.rect(cornerRadius: 12))
                        .containerRelativeFrame(.horizontal, alignment: .center)
                        .scrollTransition { content, phase in
                            content
                                .scaleEffect(
                                    x: phase.isIdentity ? 1.25 : 1,
                                    y: phase.isIdentity ? 1.25 : 1)
                        }
                        .zIndex(scrollId == index ? 1 : 0)
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(80, for: .automatic)
        .scrollTargetBehavior(.viewAligned)
        .scrollPosition(id: $scrollId)
    }
}

#Preview {
    CarouselView(images: ["brazil","spain","india"])
}

