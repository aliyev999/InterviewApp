//
//  ContactsCell.swift
//  InterviewApp
//
//  Created by AS on 04.09.2024.
//

import UIKit


class ContactsCell: UITableViewCell {
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var callView: UIView!
    @IBOutlet weak var whatsappView: UIView!
    
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
        print("Email view tapped")
        if let emailURL = URL(string: "mailto:johndoe@mail.com") {
            if UIApplication.shared.canOpenURL(emailURL) {
                UIApplication.shared.open(emailURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    @objc 
    private func callViewTapped() {
        print("Call view tapped")
        if let phoneURL = URL(string: "tel://+994505555555") {
            if UIApplication.shared.canOpenURL(phoneURL) {
                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    @objc 
    private func whatsappViewTapped() {
        print("WhatsApp view tapped")
        let phoneNumber = "+994505555555"
        let whatsappURL = URL(string: "whatsapp://send?phone=\(phoneNumber)")
        if let url = whatsappURL {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
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
