//
//  ChatList.swift
//  WeTalk
//
//  Created by gaoyu shi on 21/11/20.
//

import SwiftUI


struct ChatList: View {
    @ObservedObject var userData:UserData = UserData()
    var body: some View {
        NavigationView{
            List(userData.charList){chatItem in
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        ChatListItem(friendData: chatItem)
                    })
            }
            .navigationBarItems(leading: ChatBarView())
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
