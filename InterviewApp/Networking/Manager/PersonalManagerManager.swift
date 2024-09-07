//
//  PersonalManagerManager.swift
//  InterviewApp
//
//  Created by AS on 07.09.2024.
//

import Foundation

class PersonalManagerManager {
    func getManagersList(endpoint: ManagerEndpoint, completion: @escaping(([Manager]?, String?) -> Void)) {
        NetworkManager.request(model: [Manager].self, endpoint: endpoint.rawValue, completion: completion)
    }
}
