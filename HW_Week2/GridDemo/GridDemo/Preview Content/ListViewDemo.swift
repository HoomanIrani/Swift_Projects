//
//  ListViewDemo.swift
//  GridDemo
//
//  Created by Houman Irani on 6/11/23.
//

import SwiftUI

struct ListViewDemo: View {
    
    let data = (1...100).map {"Item \($0)"}
    
    var body: some View {
        
        NavigationView{
                VStack{
                    List(data, id:\.self) {num in
                        NavigationLink(destination: Text(num)){
                            Text(num)
                        }
                    }
                }
                .navigationTitle("Numbers")
        }
    }
}

struct ListViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListViewDemo()
    }
}

// Because it's a list we do not need a ScrollView
