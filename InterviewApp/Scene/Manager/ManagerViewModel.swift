//
//  ManagerViewModel.swift
//  InterviewApp
//
//  Created by AS on 07.09.2024.
//

import Foundation

class ManagerViewModel {
    var managers = [Manager]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    let managerManager = PersonalManagerManager()
    
    func getManagersList() {
        managerManager.getManagersList(endpoint: ManagerEndpoint.manager) { managers, error in
            if let error = error {
                self.error?(error)
            } else if let managers = managers {
                self.managers = managers
                self.success?()
            }
        }
    }
}
