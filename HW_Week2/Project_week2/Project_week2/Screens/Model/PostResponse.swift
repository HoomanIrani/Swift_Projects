//
//  PostResponse.swift
//  Project_week2
//
//  Created by Houman Irani on 6/22/23.
//

import Foundation

struct Post: Hashable, Decodable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    static let mock = Post(userId: 1, id: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
}
