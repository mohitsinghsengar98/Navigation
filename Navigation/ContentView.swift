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
            List(0..<1000){ i in
                NavigationLink("Tap Me"){ // in this it will create the multiple views when creating the this view.
                    DetailView(number: i) // this view created before showing the navigation link run and check the same.
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
