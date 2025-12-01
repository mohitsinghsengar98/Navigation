//
//  ContentView.swift
//  Navigation
//
//  Created by Mohit Sengar on 01/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath() // accept different types of navigations not specific. here works for both int and string type navigations
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                List{
                    ForEach(0..<10){i in
                        NavigationLink("Item number \(i)", value: i) // it will be open via int navigationdestination type.
                    }
                    
                    ForEach(0..<5){i in
                        NavigationLink("Item string \(i)",value: String(i))// it will be open via string navigation destination.
                    }
                }
            }.navigationDestination(for: Int.self){ selection in
                Text("Your selection \(selection)")
            }.navigationDestination(for: String.self){ selection in
                Text("Your selection string \(selection)")
            }.toolbar{
                Button("Add Int"){
                    path.append(56) // it will be open via int navigationdestination type.
                }
                
                Button("Add String"){
                    path.append("Hello world!")// it will be open via string navigation destination.
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
