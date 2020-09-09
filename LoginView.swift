//
//  LoginView.swift
//  Eater
//
//  Created by Tiffany Hsu on 12/4/19.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var email: String = ""
    @State var animation = true
    
    //kady firebase attempt
    @State var pass = ""
    @State var shown = false
    @State var msg = ""
    @State var signinsucess: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
            Text("\n\n\nhii")
                .foregroundColor(.white)
            Text("Indecisive Eaters")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.bottom, -20)
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .shadow(color: Color.orange, radius: 10)
                .scaleEffect(animation ? 0.5 : 0.6)
                .rotation3DEffect(Angle(degrees: animation ? 0 : 360), axis: (x: 0, y: 360, z: 0))
                .animation(Animation.easeInOut(duration: 3).repeatForever())
                .onAppear{self.animation.toggle() }
            
            Text("Welcome! Login First Please")
                .fontWeight(.semibold)
            
            Section {
                TextField("What's Your Email?", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(EdgeInsets(top:8, leading: 10, bottom: 8, trailing: 10))
                .multilineTextAlignment(.center)
                
                
                //Firebase Attempt
                SecureField("What's Your Password?", text: $pass).textFieldStyle(RoundedBorderTextFieldStyle()).padding().multilineTextAlignment(.center)
            }
                
                Group {
         
                    Button(action: {
                        Auth.auth().signIn(withEmail: self.email, password: self.pass){ (res, err) in
                            
                            if err != nil{
                                print(err!.localizedDescription)
                                self.msg = err!.localizedDescription
                                self.shown.toggle()
                                return
                            }
                            
                            self.signinsucess = true
                      
                        }
                    }){
                        Text("I'm Hungry, Let's GO")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top:10, leading: 20, bottom: 10, trailing: 20))
                        .background(Color.init(red: 242/255, green: 163/255, blue:64/255))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                    }
                
                    .sheet(isPresented: $signinsucess, content:{
                        HomeView()
                    })
                    Button(action: {
                        Auth.auth().createUser(withEmail: self.email, password: self.pass) {(res, err) in
                            if err != nil{
                                print(err!.localizedDescription)
                                self.msg = err!.localizedDescription
                                self.shown.toggle()
                                return
                            }
                            self.msg = "Created Successfully"
                            self.shown.toggle()
                        }
                    }){
                        Text("I'm New. Let's Check This Out")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top:10, leading: 20, bottom: 10, trailing: 20))
                        .background(Color.init(red: 242/255, green: 163/255, blue:64/255))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }.padding(.top, 15)
                    
                }.alert(isPresented: $shown){
                    return Alert(title: Text(self.msg))
                }
              
                NavigationLink(destination: HomeView()){
                Text("I'm Hungry - Let's Go")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(EdgeInsets(top:10, leading: 20, bottom: 10, trailing: 20))
                .background(Color.init(red: 242/255, green: 163/255, blue:64/255))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                 
            }
            }.padding(.top,-200)
            
        }.padding(.top, -100)
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
