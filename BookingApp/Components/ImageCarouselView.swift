//
//  ImageCarouselView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 12.09.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageCarouselView: View {
    
    var urls: [URL]
    @State private var selectionIndex: Int = 0
    
    var body: some View {
        TabView {
            ForEach(urls.indices, id: \.self) { id in
                WebImage(url: urls[id])
                    .resizable()
                    .indicator(.activity(style: .medium))
                    .clipped()
                    .tag(id)
            }
        }
        .frame(height: 257)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .tabViewStyle(.page(indexDisplayMode: .always))
        .padding(.horizontal, 16)
    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    
    static var previews: some View {
        ImageCarouselView(urls:  previewStrings.map({URL(string: $0)!}))
    }
}

fileprivate let previewStrings = [
    "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
    "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg",
    "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg"
]
