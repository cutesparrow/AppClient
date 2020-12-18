//
//  RegisterVIew.swift
//  WeTalk
//
//  Created by gaoyu shi on 15/11/20.
//
import Foundation
import SwiftUI
import Alamofire

struct RegisterVIew: View {
    @ObservedObject private var registerData:RegisterUser
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var registerFinished = false
    
    @State var registerFailReason = ""
    init() {
        self.registerData = RegisterUser()
    }
    
    var body: some View {
        VStack{
            Form{
                Section(header:Text("Account Detail")){
                    TextField("account Number", text: $registerData.account)
                        //                    .textFieldStyle(MyTextFieldStyle(color: Color.gray))
                        //                    .frame(width: 240, height: 80, alignment: .center)
                        .padding()
                    SecureField("Password", text: $registerData.password)
                        .padding()
                    
                    SecureField("Retype the password", text: $registerData.confirmPassword)
                        .padding()
                }
                Section(header:Text("User Detail")) {
                    
                    TextField("E-mail",text: $registerData.email)
                        .padding()
                }
                
                    HStack{
                        Spacer()
                        Button(action: {self.register()}){
                            LoginChoicesView(showText: "Finish", color: .green, textColor:.white)
                        }
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Button(action: {self.mode.wrappedValue.dismiss()}){
                            LoginChoicesView(showText: "Cancel", color: .gray, textColor: .white)
                        }
                        Spacer()
                    }
                
            }
        }.alert(isPresented: $registerFinished){
            Alert(title: Text(registerFailReason))
        }
        
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {self.mode.wrappedValue.dismiss()}){
                                backButton()})
        .navigationBarTitle("Register",displayMode: .inline)
    }
    
    func register(){
        NetworkManager.shared.register(registerData,path:"personal/user/register"){result in
            switch result {
            case let .success(data):
                guard let _ = try? JSONDecoder().decode(User.self, from: data) else{
                    let errorReason = try? JSONDecoder().decode(ErrorModel.self, from: data)
                    self.registerFailReason = errorReason?.reason ?? "unknown reason"
                    self.registerFinished.toggle()
                    return
                }
                self.registerFailReason = "finished"
                self.registerFinished.toggle()
                self.mode.wrappedValue.dismiss()
            case let .failure(error):
                print(error)
                
            }
        }
    }
}


struct RegisterVIew_Previews: PreviewProvider {
    static var previews: some View {
        RegisterVIew()
    }
}
