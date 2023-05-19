//
//  ItemCell.swift
//  TRA-Test
//
//  Created by Hồng Nhung on 19/05/2023.
//

import UIKit

class ItemCell: UITableViewCell {
    static let identifier = "ItemCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(with data: String) {
        self.titleLabel.text = data
    }
}
