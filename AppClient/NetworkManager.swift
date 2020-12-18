//
//  NetworkManager.swift
//  AppClient
//
//  Created by gaoyu shi on 18/12/20.
//

import Foundation
import Alamofire


private let NetworkAPIBaseURL = "http://localhost:8080/"
class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func register(_ registerUser:RegisterUser,path:String,completion:@escaping (Result<Data,Error>) -> Void) {
        AF.request(NetworkAPIBaseURL+path, method: .post,parameters: registerUser,encoder: JSONParameterEncoder.default).responseData { (response) in
            switch response.result{
            case let .success(data):completion(.success(data))
            case let .failure(error):completion(.failure(error))
            }
        }
    }
    
    func login(_ logInModel:LogInModel,path:String, completion: @escaping (Result<Data,Error>) -> Void) {
        let headers: HTTPHeaders = [.authorization(username: logInModel.account, password: logInModel.password)]
        AF.request(NetworkAPIBaseURL+path,method: .post,headers: headers).validate().responseData{ response in
            switch response.result{
            case let .success(data):completion(.success(data))
            case let .failure(error):completion(.failure(error))
            }
        }
    }
}
