//
//  ManagerDetailController.swift
//  InterviewApp
//
//  Created by AS on 07.09.2024.
//

import UIKit

class ManagerDetailController: UIViewController {
    
    let viewModel = ManagerDetailViewModel()
    
    @IBOutlet private weak var managerLabel: UILabel!
    @IBOutlet private weak var managerPhoto: UIImageView!
    @IBOutlet private weak var mainTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        managerPhoto.layer.cornerRadius = managerPhoto.frame.size.width / 2
        managerPhoto.clipsToBounds = true
        
        mainTable.reloadData()
        mainTable.allowsSelection = false
        mainTable.register(UINib(nibName: "SubtitleCell", bundle: nil), forCellReuseIdentifier: "\(SubtitleCell.self)")
        mainTable.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "\(InfoCell.self)")
        mainTable.register(UINib(nibName: "ManagerCell", bundle: nil), forCellReuseIdentifier: "\(ManagerCell.self)")
        mainTable.register(UINib(nibName: "ContactsCell", bundle: nil), forCellReuseIdentifier: "\(ContactsCell.self)")
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

//TableView Settings
extension ManagerDetailController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(SubtitleCell.self)") as! SubtitleCell
            cell.backgroundColor = UIColor.clear
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(InfoCell.self)") as! InfoCell
            cell.getInfo(info: "\(viewModel.mainManager) is temporary unavaiable. \(viewModel.manager?.name ?? "") will help you in there period.")
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ManagerCell.self)", for: indexPath) as! ManagerCell
            if let manager = viewModel.manager {
                cell.configure(with: manager)
            }

            cell.onContactAction = { action in
                switch action {
                case .call:
                    self.showToast(message: "Phone number successfully copied", font: .systemFont(ofSize: 11.0))
                case .email:
                    self.showToast(message: "E-mail successfully copied", font: .systemFont(ofSize: 14.0))
                }
            }
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ContactsCell.self)") as! ContactsCell
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            if let managerData = viewModel.manager, managerData.id == 1 {
                return 0
            } else {
                return 85
            }
        } else if indexPath.section == 2 {
            return 250
        } else if indexPath.section == 3 {
            return 130
        } else {
            return 60
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let managerIndexPath = IndexPath(row: 0, section: 0)
        if let visibleCells = mainTable.indexPathsForVisibleRows,
           visibleCells.contains(managerIndexPath) {
            managerLabel.isHidden = true
        } else {
            managerLabel.isHidden = false
        }
    }
}

//ShowToast function
extension ManagerDetailController {
    private func showToast(message: String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100,
                                               y: self.view.frame.size.height - 100,
                                               width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.systemGreen
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 18
        toastLabel.clipsToBounds = true
        
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            toastLabel.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 3.0, delay: 0.5, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: { _ in
                toastLabel.removeFromSuperview()
            })
        })
    }
}
