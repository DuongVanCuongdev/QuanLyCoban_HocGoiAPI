//
//  APIHandler.swift
//  BTVN19-10
//
//  Created by Dương Văn Cường on 21/10/2022.
//

import Foundation
import Alamofire

class APIHandler {
    let BASE_API_URL = "https://632c7f491aabd837399d7c73.mockapi.io/Friends"
    func getFriends(completion: @escaping (Friends) -> ()) {
        AF.request("\(BASE_API_URL)", method: .get).responseDecodable(of: Friends.self) { (response) in
            
            print(response.value)
            if let friendsResponse = response.value {
                completion(friendsResponse)
                print(friendsResponse)
            }
        }
        
    }
    
    func getF () {
        let headers: HTTPHeaders = [
            "Authorization": "Basic rpNmxZJ6ryKG8R8e6xnnGM1x7bkD6s",
            "Accept": "application/json"
        ]
        
        let JSON = ""

        AF.request("https://youtube.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyBv-rpNmxZJ6ryKG8R8e6xnnGM1x7bkD6s", headers: headers).responseJSON { response in
            debugPrint(response)
            
            let json = JSON.data(using: .utf8)
            
        }

//                Alamofire.request("https://youtube.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyBv-rpNmxZJ6ryKG8R8e6xnnGM1x7bkD6s", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
//                    .responseJSON { response in
//                        print("response.request \(response.request)")  // original URL request
//                        print("response.response \(response.response)") // HTTP URL response
//                        print("response.data \(response.data)")     // server data
//                        print("response.result \(response.result)")
//
//                        print("response \(response)")
//
//                }
//
//            }
    }
    

    
    func postFriend(_bodyRequest: Friend) {
        AF.request("\(BASE_API_URL)", method: .post, parameters: _bodyRequest).responseDecodable(of: Friend.self) { (response) in
        }
    }
    
    func deleteFriend(_id: String){
            AF.request("\(BASE_API_URL)/\(_id)", method: .delete).responseDecodable(of: Friend.self) { (response) in
            }
    }
    
    func putFriend(_id: String, friend: Friend){
        AF.request("\(BASE_API_URL)/\(_id)", method: .put, parameters: friend).responseDecodable(of: Friend.self) { (response) in
        }
    }
}




