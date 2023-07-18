//
//  PostCell.swift
//  Project_week2
//
//  Created by Houman Irani on 6/22/23.
//

import SwiftUI

struct PostCell: View {
    
    let Post: Post
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("\(Post.id).")
                    .font(.system(size: 18).bold())
                    .foregroundColor(.black)
                    .padding()
                Spacer()
                
                Text("User ID: \(Post.userId)")
                    .font(.callout)
                    .foregroundColor(.orange)
                    .padding()
            }
            Text("Title: \(Post.title)")
                .font(.title3)
                .foregroundColor(Color(.systemMint))
                .padding(5)
            
            Text("Body: \(Post.body)")
                .font(.body)
                .foregroundColor(.black)
                .padding(5)
        }
        Spacer()
        .padding(15)
    }
    
    /*
    struct PostCell_Previews: PreviewProvider {
        static var previews: some View {
            PostCell(Post: post)
        }
    } */
}
