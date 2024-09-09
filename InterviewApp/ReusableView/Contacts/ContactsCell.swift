//
//  ContactsCell.swift
//  InterviewApp
//
//  Created by AS on 04.09.2024.
//

import UIKit

class ContactsCell: UITableViewCell {
    
    @IBOutlet private weak var emailView: UIView!
    @IBOutlet private weak var callView: UIView!
    @IBOutlet private weak var whatsappView: UIView!
    
    var onContactAction: ((ContactAction) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupGesture()
    }
    
    private func setupGesture() {
        let emailTapGesture = UITapGestureRecognizer(target: self, action: #selector(emailViewTapped))
        emailView.isUserInteractionEnabled = true
        emailView.addGestureRecognizer(emailTapGesture)
        
        let callTapGesture = UITapGestureRecognizer(target: self, action: #selector(callViewTapped))
        callView.isUserInteractionEnabled = true
        callView.addGestureRecognizer(callTapGesture)
        
        let whatsappTapGesture = UITapGestureRecognizer(target: self, action: #selector(whatsappViewTapped))
        whatsappView.isUserInteractionEnabled = true
        whatsappView.addGestureRecognizer(whatsappTapGesture)
    }
    
    @objc
    private func emailViewTapped() {
        onContactAction?(.email)
    }
    
    @objc
    private func callViewTapped() {
        onContactAction?(.call)
    }
    
    @objc
    private func whatsappViewTapped() {
        onContactAction?(.whatsapp)
    }
}

//UI Configure
extension ContactsCell {
    private func setupUI() {
        makeRounded(view: emailView)
        makeRounded(view: callView)
        makeRounded(view: whatsappView)
    }
    
    private func makeRounded(view: UIView) {
        view.layer.cornerRadius = view.frame.height / 2
        view.layer.masksToBounds = true
    }
}
