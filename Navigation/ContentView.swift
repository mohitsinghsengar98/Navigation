//
//  ContentView.swift
//  Navigation
//
//  Created by Mohit Sengar on 01/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [Int]()
    var body: some View {
        NavigationStack(path:$path){
            VStack{
                Button("show 32"){
                    path = [32]
                }
                
                Button("show 64"){
                    path.append(64)
                }
                
                Button("show 32 and 64"){
                    path = [32,64]
                }.navigationDestination(for: Int.self){ selection in
                    Text("Your selection \(selection)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
