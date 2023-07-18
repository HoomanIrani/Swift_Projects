//
//  PostModelView.swift
//  Project_week2
//
//  Created by Houman Irani on 6/22/23.
//

import Foundation
import Combine

class UserModelView: ObservableObject {
    
    @Published var myPost = [Post]()
    
    var cancellable = Set<AnyCancellable>()
    let service = PostService()
    
    func getPosts() {
        
        service.fetchPosts()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    print(err.localizedDescription)
                }
            } receiveValue: { myPost in
                self.myPost = myPost
            }
            .store(in: &cancellable)
    }
}
