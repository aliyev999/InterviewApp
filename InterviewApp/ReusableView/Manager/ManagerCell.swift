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
    
    var onPhoneCopyButtonTapped: (() -> Void)?
    var onEmailCopyButtonTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func getManagerData(nameLabel: String, phoneLabel: String, emailLabel: String) {
        self.nameLabel.text = nameLabel
        self.phoneLabel.text = phoneLabel
        self.emailLabel.text = emailLabel
    }
    
    @IBAction func phoneCopyTapped(_ sender: Any) {
        UIPasteboard.general.string = phoneLabel.text
        onPhoneCopyButtonTapped?()
    }
    
    @IBAction func emailCopyTapped(_ sender: Any) {
        UIPasteboard.general.string = emailLabel.text
        onEmailCopyButtonTapped?()
    }
}
