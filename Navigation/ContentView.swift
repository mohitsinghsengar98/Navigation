//
//  ContentView.swift
//  Navigation
//
//  Created by Mohit Sengar on 01/12/25.
//

import SwiftUI

struct DetailView:View {
    let number:Int
    @Binding var path : NavigationPath
    
    var body: some View {
        NavigationLink("Go to random number",value:Int.random(in: 0...1000))
            .navigationTitle("Number: \(number)")
            .toolbar{
                Button("Home"){
                    path = NavigationPath() // reset to home.
//                    path = path.removeAll() // reset to home. when all the
                }
            }
    }
}

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self){ i in
                    DetailView(number:i,path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}
