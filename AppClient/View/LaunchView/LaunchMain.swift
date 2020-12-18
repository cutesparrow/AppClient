//
//  LogInMain.swift
//  WeTalk
//
//  Created by gaoyu shi on 15/11/20.
//

import SwiftUI

struct LaunchMain: View {
    let mainSwitch = MainSwitch(choices: ["Log In","Register"])
    
    
    var body: some View {
        NavigationView(content: {
            VStack{
                Spacer()
                Image(systemName:"bubble.left.and.bubble.right.fill")
                    .font(.system(size: 120, weight: .regular))
                    .foregroundColor(.green)
                    .padding(.bottom,140)
                    
                NavigationLink(destination: LogInView()) {
                    LoginChoicesView(showText: mainSwitch.choices[0],color: .green,textColor: Color(.white))
                        
                }
                
                .padding(.bottom,20)
                NavigationLink(
                    destination: RegisterVIew()) {
                    LoginChoicesView(showText: mainSwitch.choices[1],color: .gray,textColor: Color(.white))
                }
                .padding(.bottom,170)
            }
        })
    }
}
// return login and register button
struct LoginChoicesView:View {
    let showText: String
    let color: Color
    let textColor: Color
    var body: some View{
        Text(showText)
            .frame(width: 100, height: 50, alignment: .center)
            .foregroundColor(textColor)
            .background(color, alignment: .center)
            .cornerRadius(12)
    }
}
struct LogInMain_Previews: PreviewProvider {
    static var previews: some View {
        LaunchMain()
    }
}
