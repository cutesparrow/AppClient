//
//  ErrorModel.swift
//  AppClient
//
//  Created by gaoyu shi on 18/12/20.
//

import Foundation


class ErrorModel:Codable{
    public var error:Bool
    public var reason:String
    init() {
        self.error = false
        self.reason = ""
    }
}
