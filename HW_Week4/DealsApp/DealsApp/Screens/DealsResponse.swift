import Foundation

struct DealsResponse: Decodable {
    let data: Deals
}

struct Deals: Decodable {
    let deals: [Deal]
}

struct Deal: Decodable, Identifiable {
    let id: String
    let title: String
    let url: String
    let price: Int
    let description: String
    let product: Product
    let createdAt: String
    let updatedAt: String
    let likes: [Likes]
    let dislikes: [Dislikes]
    let comments: [Comments]
    
}

struct Product: Decodable {
    let availability: String
    let image: String
    let description: String
    let sku: String
    let updatedAt: String
}

struct Likes: Decodable, Identifiable {
    let id: String
    let user: User
}

struct Dislikes: Decodable {
    let id: String
    let user: User
}

struct Comments: Decodable {
    let id: String
    let createdAt: String
    let text: String
    let user: User
}

struct User: Decodable {
    let id: String?
    let name: String
}

