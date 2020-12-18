//
//  LogInView.swift
//  WeTalk
//
//  Created by gaoyu shi on 15/11/20.
//

import SwiftUI

struct LogInView: View {
    @ObservedObject var logInUser:LogInModel
    @State var success:Bool = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var fail:Bool = false
    
    init() {
        self.logInUser = LogInModel()
    }
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Image(systemName:"bubble.left.and.bubble.right.fill")
                .font(.system(size: 120, weight: .regular))
                .foregroundColor(Color(.systemGreen))
                .padding(.bottom,140)
            TextField("account Number", text: $logInUser.account)
                .textFieldStyle(MyTextFieldStyle(color: Color(.systemGreen)))
                .frame(width: 240, height: 80, alignment: .center)
            
            //            .navigationBarBackButtonHidden(true)  待解决
            SecureField("account Number", text: $logInUser.password)
                .textFieldStyle(MyTextFieldStyle(color: Color.gray))
                
                .frame(width: 240, height: 80, alignment: .center)
            Button(action: {self.login()}){
                LoginChoicesView(showText: "Log In",color: .green, textColor: .white)
                
            }
            .padding(.bottom,20)
            .padding(.top,30)
            Button(action: {self.mode.wrappedValue.dismiss()}, label: {
                LoginChoicesView(showText: "Cancel",color: .gray, textColor: .white)

            })
            NavigationLink(
                destination: MainView(),
                isActive: $success,
                label: {
                    EmptyView()
                        .frame(width: 0, height: 0, alignment: .center)
                })
        }.alert(isPresented: self.$fail, content: {
            Alert(title: Text("Unauthorize"))
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {self.mode.wrappedValue.dismiss()}){
                                backButton()})
        .navigationBarTitle("Log In",displayMode: .inline)
    }
    
    func login(){
        NetworkManager.shared.login(logInUser, path: "personal/user/login") { result in
            
            switch result {
            case let .success(data):
                guard let token = try? JSONDecoder().decode(Token.self, from: data) else{
                    return
                }
                current_token = Token(id: token.id!, value: token.value, expiration: token.expiration, user: token.user)
                self.success.toggle()
            case .failure(_):
                self.fail.toggle()
                
            }
            }
        }
    }






struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
