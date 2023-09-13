//
//  HotelInfoCategoriesView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import SwiftUI

enum HotelInfoCategories: CaseIterable {
    case сonveniences
    case included
    case notIncluded
    
    var icon: String {
        switch self {
        case .сonveniences:
            return Assets.Icons.emojiHappy
        case .included:
            return Assets.Icons.tickSquare
        case .notIncluded:
            return Assets.Icons.closeSquare
        }
    }
    
    var title: LocalizedStringKey {
        switch self {
        case .сonveniences:
            return "hotel_section_conviniences"
        case .included:
            return "hotel_section_included"
        case .notIncluded:
            return "hotel_section_not_included"
        }
    }
    
    var subtitle: LocalizedStringKey {
        switch self {
        case .сonveniences:
            return "hotel_section_conviniences_subtitle"
        case .included:
            return "hotel_section_conviniences_subtitle"
        case .notIncluded:
            return "hotel_section_conviniences_subtitle"
        }
    }
}


struct HotelInfoCategoriesView: View {
    
    var body: some View {
        VStack {
            ForEach(HotelInfoCategories.allCases, id: \.hashValue) { category in
                Button {
                    //
                } label: {
                    categoryView(category)
                }
            }
            .separator(showLast: false) { _ in
               separator
            }
        }
        .padding(15)
        .background(Color.secondaryBackground)
        .cornerRadius(15)
        
    }
    
    func categoryView(_ category: HotelInfoCategories) -> some View {
            HStack(spacing: 12) {
                Image(category.icon)
                    .resizable()
                    .frame(width: 24, height: 24)
                VStack(spacing: 2) {
                    Text(category.title)
                        .font(.custom(Fonts.regular, size: 14))
                        .foregroundColor(.contentPrimary)
                        .aligment(.leading)
                    Text(category.subtitle)
                        .font(.custom(Fonts.regular, size: 14))
                        .foregroundColor(.contentSecondary)
                        .aligment(.leading)
                }
                Spacer()
                Image("rightArrow")
                    .frame(width: 24, height: 24)
            }
    }
    
    var separator: some View {
        Rectangle()
            .fill(Color(red: 0.51, green: 0.53, blue: 0.59).opacity(0.15))
            .frame(height: 1)
            .padding(.leading, 36)
    }
}

struct ForEachWithSeparator<Data: RandomAccessCollection, Content: View, Separator: View>: View
where Data.Element: Hashable {
    let data: Data // data to render
    let content: (Data.Element) -> Content // data item render
    let separator: (Data.Element) -> Separator // separator renderer
    let showLast: Bool // if true, shows the separator at the end of the list
    
    var body: some View {
        let size = data.count * 2 - (showLast ? 0 : 1)
        let firstIndex = data.indices.startIndex
        return ForEach(0..<size, id: \.hashValue) { i in
            let element = data[data.index(firstIndex, offsetBy: i / 2)]
            if i % 2 == 0 {
                content(element)
            } else {
                separator(element)
            }
        }
    }
}

extension ForEach where Data.Element: Hashable, Content: View {
    func separator<Separator: View>(showLast: Bool = true,
                                    @ViewBuilder separator: @escaping (Data.Element) -> Separator) -> some View {
        ForEachWithSeparator(data: data,
                             content: content,
                             separator: separator,
                             showLast: showLast)
    }
}

struct HotelInfoCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        HotelInfoCategoriesView()
    }
}
