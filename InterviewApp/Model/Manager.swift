//
//  Manager.swift
//  InterviewApp
//
//  Created by AS on 07.09.2024.
//

import Foundation

protocol ManagerDataProtocol {
    var name: String? { get }
    var phone: String? { get }
    var email: String? { get }
}

struct Manager: Codable, ManagerDataProtocol {
    let id: Int?
    let name: String?
    let email: String?
    let phone: String?
}
