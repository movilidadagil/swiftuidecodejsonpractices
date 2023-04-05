//
//  JSONManager.swift
//  JSONTest
//
//  Created by Federico on 08/02/2022.
//
//  Use a model generator like: https://app.quicktype.io/

import Foundation



// import com.fasterxml.jackson.databind.ObjectMapper; // version 2.11.1
// import com.fasterxml.jackson.annotation.JsonProperty; // version 2.11.1
/* ObjectMapper om = new ObjectMapper();
Root[] root = om.readValue(myJsonString, Root[].class); */

struct RootSubmenuDecoder {
    static let allSubmenus: [RootSubmenu] = Bundle.main.decode(file: "dessertlist.json")
    static let sampleDessertList: Submenu = allSubmenus[0].submenus[0]

}

struct RootSubmenu: Codable{
    let id: Int
    let submenus: [Submenu]
    let venusmenuuid: String
    let dessertlistuuid: String
}

struct Submenu: Codable{
    let name: String
    let imagename: String
    let price: String
    let uuid: String
    let description: String
    let currencyunit: String
}


struct Issue: Codable{
    let id: Int
    let  name: String
}

struct PetitionType: Codable{
    let id: Int
    let name: String
}

struct Result: Codable{
    let  id: String
    let  type: String
    let  title: String
    let  body: String
    let petition_type:  [PetitionType]
    let issues:  [Issue]
    let signatureThreshold: Int
    let signatureCount: Int
    let signaturesNeeded: Int
    let  url: String
    let deadline: Int
    let  status: String
    let created: Int
    let isSignable: Bool
    let  isPublic: Bool
    let reachedPublic: Int
}

struct Root: Codable{
    var results: [Result]
}


struct RootDecoder {
    static let allPetitions: Root = Bundle.main.decode(file: "petition.json")
    static let samplePetition: Result = allPetitions.results[0]

}


struct User: Codable {
    let id: Int
    let email: String
    let name: String
    let username: String
    let company: Company
    static let allUser: [User] = Bundle.main.decode(file: "person.json")
    static let sampleUser: User = allUser[0]
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
}

struct Person: Codable{
    let firstName, surname, gender: String
    let age: Int
    let address: Address
    let phoneNumbers: [PhoneNumber]
    
    // Generate samples
    static let allPeople: [Person] = Bundle.main.decode(file: "example.json")
    static let samplePerson: Person = allPeople[0]
}

struct Address: Codable {
    let streetAddress, city, state, postalCode: String
}

struct PhoneNumber: Codable {
    let type, number: String
}

// Extension to decode JSON locally
extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}
