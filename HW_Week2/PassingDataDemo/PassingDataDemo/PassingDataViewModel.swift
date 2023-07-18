//
//  PassingDataViewModel.swift
//  PassingDataDemo
//
//  Created by Houman Irani on 6/11/23.
//

import Foundation

struct Person: Identifiable {
    
    var id = UUID()
    let firstName: String
    let lastName: String
    
    static let mockPerson = [
           Person(firstName: "Tim", lastName: "Davis"),
           Person(firstName: "Nathan", lastName: "Lion"),
           Person(firstName: "Sally", lastName: "Jones"),
           Person(firstName: "Bob", lastName: "Nelson"),
           Person(firstName: "Demian", lastName: "Hans"),
           Person(firstName: "Hooman", lastName: "Irani"),
    ]
    
}

class PassingDataViewModel: ObservableObject{
    
    @Published var persons: [Person] = [Person(firstName: "Sammy", lastName: "Doodles")]
    
    func fetchPerson() {
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            self.persons = Person.mockPerson
        }
    }
}
