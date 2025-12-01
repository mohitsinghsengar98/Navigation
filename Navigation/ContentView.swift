//
//  ContentView.swift
//  Navigation
//
//  Created by Mohit Sengar on 01/12/25.
//

import SwiftUI

struct DetailView:View {
    let number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating the detail View")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack{
            NavigationLink("Tap Me"){
                DetailView(number: 5)
            }
        }
    }
}

#Preview {
    ContentView()
}
