//
//  NetworkConstants.swift
//  InterviewApp
//
//  Created by AS on 07.09.2024.
//

import Foundation
import Alamofire

struct NetworkConstants {
    static let baseUrl = "https://jsonplaceholder.typicode.com/"
    
    static func getUrl(with endpoint: String) -> String {
        return baseUrl + endpoint
    }
    
    static var header: HTTPHeaders {
        return ["Content-Type": "application/json"]
    }
}
