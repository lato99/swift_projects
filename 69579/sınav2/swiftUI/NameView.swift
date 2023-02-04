//
//  PlayerView.swift
//  swiftUI
//
//  Created by Lutfu on 2.01.2023.
//

import SwiftUI

struct NameView: View {

    let title : String
    

    var body: some View {
        VStack {
            Text(title)
            
//                .cornerRadius(15)
//                .shadow(radius: 10)
        }
        .padding(20)
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(title: "initialized")
            .previewLayout(.sizeThatFits)
    }
}
