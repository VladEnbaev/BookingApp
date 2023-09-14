//
//  PerticularitiesView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import SwiftUI

// thanks https://github.com/mralexhay
// this is best solution if you want ios 15+

struct PeculiaritiesView: View {
    var peculiarities: [String]

    @State private var totalHeight = CGFloat.zero
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
        .padding(.leading, -4)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.peculiarities, id: \.self) { tag in
                self.item(for: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.peculiarities.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.peculiarities.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String) -> some View {
        PeculiarityItemView(description: text)
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

struct PeculiarityItemView: View {

    var description: String

    var body: some View {
        Text(description)
            .font(.custom(Fonts.medium, size: 16))
            .foregroundColor(.contentSecondary)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.secondaryBackground)
            .cornerRadius(5)
    }
}

struct PeculiaritiesView_Previews: PreviewProvider {

    static var peculiarities = ["3-я линия", "Платный Wi-Fi в фойе", "30 км до аэропорта", "1 км до пляжа", "40 км до аэропорта"]

    static var previews: some View {
        PeculiaritiesView(peculiarities: peculiarities)
    }
}
