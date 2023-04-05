//
//  PetitionDetailView.swift
//  JSONTest
//
//  Created by Hasan Hüseyin Ali Gül on 5.04.2023.
//
import SwiftUI

struct PetitionDetailView: View {
    var petition: Result
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(petition.title)")
                .bold()
            Text("\(petition.body)")
          
        }
    }
}

struct PetitionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PetitionDetailView(petition: RootDecoder.samplePetition)
    }
}
