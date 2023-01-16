//
//  Auth.swift
//  FirebaseApp
//
//  Created by Айбек on 17.01.2023.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseAuth

struct Login: View {
    
    @State var user = ""
    @State var pass = ""
    @State var message = ""
    @State var alert = false
    @State var show = false
    
    var body : some View{
        
        VStack {
            
            Image("whiteLogo")
                .resizable()
                .frame(width: 150, height: 150, alignment: .top)
            
            Text("Sign In").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)
            VStack {
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("Username").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        HStack{
                            TextField("Enter Your Username", text: $user)
                            if user != "" {
                                Image("check").foregroundColor(Color.init(.label))
                            }
                        }
                        Divider()
                    }
                    .padding(.bottom, 15)
                    
                    VStack(alignment: .leading){
                        Text("Password").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        SecureField("Enter Your Password", text: $pass)
                        Divider()
                    }
                    
                }
                .padding(.horizontal, 6)
            }
            .padding()
            
            
            VStack{
                Button(action: {
                    LoginWithEMail(email: self.user, password: self.pass) { (verified, status) in
                        if !verified {
                            self.message = status
                            self.alert.toggle()
                        } else {
                            UserDefaults.standard.set(true, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                        }
                    }
                }) {
                    Text("Sign In").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                }
                .background(Color.green)
                .clipShape(Capsule())
                .padding(.top, 45)
                .alert(isPresented: $alert) {
                    Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("OK")))
                }
                
                NavigationLink(destination: Registration()) {
                    HStack(spacing: 8){
                        Text("Don't Have An Account?").foregroundColor(Color.gray.opacity(0.5))
                        Button(action: {
                            //
                        }) {
                            Text("Sign Up")
                        }.foregroundColor(.blue)
                    }
                    .padding(.top, 25)
                }
            }
        }
    }
}


struct Registration: View {
    
    @State var user = ""
    @State var pass = ""
    @State var message = ""
    @State var alert = false
    @State var show = false
    
    var body : some View {
        
        VStack {
            
            Image("whiteLogo")
                .resizable()
                .frame(width: 150, height: 150, alignment: .top)
            
            Text("Sign Up").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)
            VStack {
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("Username").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        HStack{
                            TextField("Enter Your Username", text: $user)
                            if user != "" {
                                Image("check").foregroundColor(Color.init(.label))
                            }
                        }
                        Divider()
                    }
                    .padding(.bottom, 15)
                    
                    VStack(alignment: .leading){
                        Text("Password").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        SecureField("Enter Your Password", text: $pass)
                        Divider()
                    }
                    
                }
                .padding(.horizontal, 6)
            }
            .padding()
            
            
            VStack{
                Button(action: {
                    ReginWithEMail(email: self.user, password: self.pass) { (verified, status) in
                        if !verified {
                            self.message = status
                            self.alert.toggle()
                        } else {
                            UserDefaults.standard.set(true, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                        }
                    }
                }) {
                    Text("Sign Up").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                }
                .background(Color.green)
                .clipShape(Capsule())
                .padding(.top, 45)
                .alert(isPresented: $alert) {
                    Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("OK")))
                }
                
                NavigationLink(destination: Registration()) {
                    HStack(spacing: 8){
                        Text("Already have an account?").foregroundColor(Color.gray.opacity(0.5))
                        Button(action: {
                            //
                        }) {
                            Text("Sign In")
                        }.foregroundColor(.blue)
                    }
                    .padding(.top, 25)
                }
                .sheet(isPresented: $show) {
                    Login(show: self.show)
                }
            }
        }
        .alert(isPresented: $alert) {
            Alert(title: Text("Your account has been created, please go back and Sign In"), dismissButton: .default(Text("OK")))
        }
    }
}


func LoginWithEMail(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
        if err != nil {
            completion(false,(err?.localizedDescription)!)
            return
        }
        
        completion(true,(res?.user.email)!)
    }
}

func ReginWithEMail(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
        if err != nil {
            completion(false,(err?.localizedDescription)!)
            return
        }
        
        completion(true,(res?.user.email)!)
    }
}


struct homeWithLogout: View {
    var body: some View {
        Text("This is the safe place")
        
        Button(action: {
            UserDefaults.standard.set(false, forKey: "status")
            NotificationCenter.default.post(name: NSNotification.Name("statucChange"), object: nil)
        }) {
            Text("Logout")
        }
    }
}
// this is comment
