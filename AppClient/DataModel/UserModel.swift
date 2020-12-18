//
//  UserData.swift
//  WeTalk
//
//  Created by gaoyu shi on 16/11/20.
//

import Foundation


class User: Codable {
    public var id:UUID
    public var account:String
    public var sex:SexType
    public var birthday:String
    public var icon:String?
    public var email:String
    
    init(id:UUID,account:String,icon:String,sex:SexType,birthday:Date,email:String) {
        self.id = id
        self.account = account
        self.icon = icon
        self.sex = sex
        self.birthday = ConvertDateToString(date: birthday)
        self.email = email
    }
    init() {
        self.id = UUID()
        self.account = ""
        self.icon = ""
        self.sex = SexType.male
        self.birthday = ""
        self.email = ""
    }
    
}

class RegisterUser:Codable,ObservableObject {
    public var account:String
    public var sex:SexType
    public var birthday:String
    public var icon:String?
    public var email:String
    public var password:String
    public var confirmPassword:String
    init(account: String, icon: String, sex: SexType, birthday: Date, email: String,password:String,confirmPassword:String) {
        self.account = account
        self.icon = icon
        self.sex = sex
        self.birthday = ConvertDateToString(date: birthday)
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }
    init() {
        self.account = ""
        self.icon = ""
        self.sex = SexType.male
        self.birthday = ConvertDateToString(date: Date())
        self.email = ""
        self.password = ""
        self.confirmPassword = ""
    }
    
}

class Token:Codable{
    var id: UUID?

    var value: String
    
    var expiration:String
    
    var user: UserParent
    
    init(id:UUID,value:String,expiration:String,user:UserParent) {
        self.id = id
        self.value = value
        self.expiration = expiration
        self.user = user
    }
}

class UserParent:Codable{
    var id:UUID
    init() {
        self.id = UUID()
    }
}

enum SexType:String,Codable{
    static let name = "SEX_TYPE"
    case male,female
}

