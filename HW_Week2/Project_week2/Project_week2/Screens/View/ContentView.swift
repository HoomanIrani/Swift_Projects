//
//  ContentView.swift
//  Project_week2
//
//  Created by Houman Irani on 6/22/23.
//

import SwiftUI

struct ContentView: View {
    
    //let datasource: [Post] =  [Post.mock]
    @StateObject var viewModel: UserModelView = UserModelView()
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(colors: [.white,.gray,.white], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea(.all)
                VStack {
                    Text("User Profiles and Posts")
                        .foregroundColor(.blue.opacity(3.0))
                        .font(.title)
                        .bold()
                        .padding()
                    listView()
                        .cornerRadius(25)
                        .padding()
                        .onAppear {
                            viewModel.getPosts()
                        }
                }
            }
        }
    }
    
    
    private func listView() -> some View {
        List(viewModel.myPost, id: \.self) { post in
            NavigationLink {
                PostCell(Post: post)
            } label: {
                
                ZStack{
                    VStack(alignment: .leading){
                        HStack(alignment: .firstTextBaseline){
                            Text("User ID: \(post.userId)")
                                .font(.system(size: 18).bold())
                                .foregroundColor(.black)
                                .padding(10)
                            
                            Text("Post No: \(post.id)")
                                .font(.system(size: 18).bold())
                                .foregroundColor(.black)
                                .padding(10)
                        }
                    }
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .padding(1)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

