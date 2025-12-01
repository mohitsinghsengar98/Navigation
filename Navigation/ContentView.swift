//
//  ContentView.swift
//  Navigation
//
//  Created by Mohit Sengar on 01/12/25.
//

import SwiftUI

// if we have defined the path as [Int] int array.
@Observable
class PathStore{
    var path : [Int]{
        didSet{
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init(){
        if let data = try? Data(contentsOf: savePath){
            if let decoded = try? JSONDecoder().decode([Int].self, from: data){
                path = decoded
                return
            }
        }
        
        path = []
    }
    
    func save(){
        do{
            let pathData = try JSONEncoder().encode(path)
            try? pathData.write(to: savePath)
        }catch{
            print("failed to save the data")
        }
    }
}

struct DetailView:View {
    let number:Int
    @Binding var path : [Int]
    
    var body: some View {
        NavigationLink("Go to random number",value:Int.random(in: 0...1000))
            .navigationTitle("Number: \(number)")
            .toolbar{
                Button("Home"){
//                    path = NavigationPath() // reset to home.
                    path.removeAll() // reset to home. when all the
                }
            }
    }
}

struct ContentView: View {
//    @State private var path = [Int]()
    @State private var path = PathStore()
    
    var body: some View {
        NavigationStack(path: $path.path){
            DetailView(number: 0, path: $path.path)
                .navigationDestination(for: Int.self){ i in
                    DetailView(number:i,path: $path.path)
                }
        }
    }
}

#Preview {
    ContentView()
}
