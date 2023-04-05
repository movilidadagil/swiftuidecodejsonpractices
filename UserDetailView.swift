//
//  UserDetailView.swift
//  JSONTest
//
//  Created by Hasan Hüseyin Ali Gül on 5.04.2023.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(user.username) \(user.name)")
                .bold()
            Text("\(user.email)")
            Text("\(user.company.name)")
          
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(person: Person.samplePerson)
    }
}
