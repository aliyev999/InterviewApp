//
//  ManagerCell.swift
//  InterviewApp
//
//  Created by AS on 06.09.2024.
//

import UIKit

class ManagerCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    var onCopyAction: ((CopyAction) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with manager: ManagerDataProtocol) {
        self.nameLabel.text = manager.name
        self.phoneLabel.text = manager.phone
        self.emailLabel.text = manager.email
    }
    
    @IBAction func phoneCopyTapped(_ sender: Any) {
        UIPasteboard.general.string = phoneLabel.text
        if let phone = phoneLabel.text {
            onCopyAction?(.call(phone))
        }
    }
    
    @IBAction func emailCopyTapped(_ sender: Any) {
        UIPasteboard.general.string = emailLabel.text
        if let email = emailLabel.text {
            onCopyAction?(.email(email))
        }
    }
}
