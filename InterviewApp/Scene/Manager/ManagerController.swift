//
//  UsersListController.swift
//  InterviewApp
//
//  Created by AS on 04.09.2024.
//

import UIKit

class ManagerController: UIViewController {
    
    @IBOutlet private weak var table: UITableView!
    
    private let viewModel = ManagerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
    }
    
    private func configureViewModel() {
        viewModel.getManagersList()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            self.table.reloadData()
        }
    }
}

//Tableview Settings
extension ManagerController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.managers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = viewModel.managers[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = viewModel.managers[indexPath.row]
        let controller = storyboard?.instantiateViewController(identifier: "\(ManagerDetailController.self)") as! ManagerDetailController
        controller.viewModel.manager = selectedUser
        navigationController?.modalPresentationStyle = .popover
        navigationController?.present(controller, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
