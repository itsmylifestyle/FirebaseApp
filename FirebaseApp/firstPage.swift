//
//  firstPage.swift
//  FirebaseApp
//
//  Created by Айбек on 17.01.2023.
//

import Foundation
import SwiftUI

struct first: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        Text("Welcome to,")
                            .foregroundColor(Color.white)
                            .font(.system(size: 70, weight: .bold, design: .monospaced))
                            .padding()
                        
                        Image("blackLogo")
                            .resizable()
                            .frame(width: 240, height: 240)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Divider()
                            .background(Color.white)
                            .padding()
                    }
                    
                    VStack {
                        HStack {
                            Spacer()

                            NavigationLink(destination: Login()) {
                                HStack {
                                    Text("Sign In")
                                        .foregroundColor(.white)
                                        .padding()
                                        .border(.white)
                                        .font(.headline)
                                }
                            }
                            Spacer()
                            
                            NavigationLink(destination: Registration()) {
                                HStack {
                                    Text("Sign Up")
                                        .foregroundColor(.white)
                                        .padding()
                                        .border(.white)
                                        .font(.headline)
                                }
                            }
                            Spacer()
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}
// this is comment

