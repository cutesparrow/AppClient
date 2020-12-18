//
//  LogInModel.swift
//  AppClient
//
//  Created by gaoyu shi on 18/12/20.
//

import Foundation

class LogInModel:ObservableObject {
    var account:String
    var password:String
    init(account:String,password:String) {
        self.account = account
        self.password = password
    }
    init() {
        self.account = ""
        self.password = ""
    }
}
