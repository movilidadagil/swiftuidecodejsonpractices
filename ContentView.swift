//
//  ContentView.swift
//  JSONTest
//
//  Created by Federico on 08/02/2022.
//

import SwiftUI

struct ContentView: View {
    private var people: [Person] = Person.allPeople
    private var users: [User] = User.allUser
    private var petitions: [Result] = RootDecoder.allPetitions.results
    private var desserts: [Submenu] = RootSubmenuDecoder.allSubmenus[0].submenus

    var body: some View {
        VStack{
            NavigationView {
                List {
                
                    ForEach(desserts, id: \.name) { dessert in
                            NavigationLink(destination: DessertDetailView(dessert: dessert)) {
                                VStack(alignment: .leading) {
                                    Text("\(dessert.name)")
                                        .bold()
                                    Text("\(dessert.description)")
                                        .foregroundColor(.gray)
                                    Text("\(dessert.price)")
                                        .foregroundColor(.gray)
                                    Text("\(dessert.currencyunit)")
                                        .foregroundColor(.gray)
                                }
                                .padding(6)
                            }
                        }
                   
                }                .navigationTitle("Dessertbook")

             
            }.padding()
            NavigationView {
                List {
                
                    ForEach(petitions, id: \.id) { petition in
                            NavigationLink(destination: PetitionDetailView(petition: petition)) {
                                VStack(alignment: .leading) {
                                    Text("\(petition.title)")
                                        .bold()
                                    Text("\(petition.body)")
                                        .foregroundColor(.gray)
                                }
                                .padding(6)
                            }
                        }
                   
                }                .navigationTitle("Petitionbook")

             
            }.padding()
            
            NavigationView {
                    List {
                     
                            ForEach(people, id: \.firstName) { person in
                                 NavigationLink(destination: DetailView(person: person)) {
                                     VStack(alignment: .leading) {
                                         Text("\(person.firstName) \(person.surname)")
                                             .bold()
                                         Text("\(person.phoneNumbers[0].number)")
                                             .foregroundColor(.gray)
                                     }
                                     .padding(6)
                                 }
                             }
                       
                    
                    }
                    .navigationTitle("Phonebook")
                    
            }.padding()
            NavigationView {
                List {
                
                        ForEach(users, id: \.username) { user in
                            NavigationLink(destination: UserDetailView(user: user)) {
                                VStack(alignment: .leading) {
                                    Text("\(user.name) \(user.email)")
                                        .bold()
                                    Text("\(user.company.name)")
                                        .foregroundColor(.gray)
                                }
                                .padding(6)
                            }
                        }
                   
                }                .navigationTitle("Userbook")

             
            }.padding()
            
      
        }
        
      
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
