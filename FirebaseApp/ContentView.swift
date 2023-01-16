//
//  ContentView.swift
//  FirebaseApp
//
//  Created by Айбек on 16.01.2023.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth 

struct ContentView: View {
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        VStack {
            if status {
                homeWithLogout()
            } else {
                first()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// this is comment

