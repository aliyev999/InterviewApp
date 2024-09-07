//
//  InfoCell.swift
//  InterviewApp
//
//  Created by AS on 05.09.2024.
//

import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet private weak var infoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func getInfo (info: String) {
        infoLabel.text = info
    }
}
