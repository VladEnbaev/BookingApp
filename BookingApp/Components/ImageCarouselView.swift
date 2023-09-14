//
//  ImageCarouselView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 12.09.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageCarouselView: View {
    
    var urls: [String]
    @State private var selectionIndex: Int = 0
    
    var body: some View {
        TabView {
            if !urls.isEmpty {
                ForEach(urls.indices, id: \.self) { id in
                    webImage(urlString: urls[id])
                        .clipped()
                        .tag(id)
                }
            } else {
                placeholder
            }
            
        }
        .frame(height: 257)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
    
    @ViewBuilder
    func webImage(urlString: String) -> some View {
        if let url = URL(string: urlString) {
            WebImage(url: url)
                .resizable()
                .placeholder(content: {
                    placeholder
                })
                .indicator(.activity(style: .medium))
        } else {
            placeholder
        }
    }
    
    var placeholder: some View {
        Image(Assets.Images.placeholder)
    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    
    static var previews: some View {
        ImageCarouselView(urls:  previewImageURls)
    }
}

let previewImageURls = [
    "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
    "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg",
    "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg"
]
