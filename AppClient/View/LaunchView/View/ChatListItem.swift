//
//  ChatListItem.swift
//  WeTalk
//
//  Created by gaoyu shi on 21/11/20.
//

import SwiftUI

struct ChatListItem: View {
    var friendData:FriendData
    var body: some View {
        VStack{
            HStack{
            Image(systemName: friendData.photo)
                .frame(width: 50, height: 50, alignment: .center)
            VStack(alignment:.leading){
                Text(friendData.userName)
                    .font(.title2)
                Text(friendData.lastestMessage)
                    .opacity(0.8)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(friendData.lastestTime)
                .foregroundColor(.gray)
                .padding()
        }
        }
        
    }
}

struct ChatListItem_Previews: PreviewProvider {
    
    static var previews: some View {
        let a:FriendData = FriendData(accountNumber: "1", userName: "wu", photo: "star", lastestMessage: "fsdfks;jdjf", lastestTime: getNowTime())

        return ChatListItem(friendData: a)
    }
}
