//
//  DessertDetailView.swift
//  JSONTest
//
//  Created by Hasan Hüseyin Ali Gül on 5.04.2023.
//

import SwiftUI

struct DessertDetailView: View {
    var dessert: Submenu
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(dessert.name)")
                .bold()
            Text("\(dessert.description)")
                .bold()
            Text("\(dessert.imagename)")
            Text("\(dessert.price)")
            Text("\(dessert.currencyunit)")
        }
    }
}

struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailView(dessert: RootSubmenuDecoder.sampleDessertList)
    }
}
