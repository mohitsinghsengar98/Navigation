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
                NavigationLink("Select \(i)",value: i)
            }.navigationDestination(for: Int.self){ selection in  // by using the navigation destination we are creating the view only when it is called. not when we are showing the /setupping this navigation link.
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
