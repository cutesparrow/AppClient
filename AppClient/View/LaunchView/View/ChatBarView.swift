//
//  ChatBarView.swift
//  WeTalk
//
//  Created by gaoyu shi on 21/11/20.
//

import SwiftUI

struct ChatBarView: View {
    var body: some View {
        HStack{
            Button(action: {print("click left button on the chatBar")}, label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(Color(.systemGray))
            })
            Spacer()
            Text("Chat List")
                .font(.title)
                .opacity(0.8)
                .foregroundColor(Color(.black))
            Spacer()
            Button(action: {print("click right button on the charBar")}, label: {
                Image(systemName: "video")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(Color(.systemGray))
            })
        }
        .frame(width: UIScreen.main.bounds.width-50)
        
        .padding()
    }
}

struct ChatBarView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBarView()
    }
}
