//
//  MainTableViewCell.swift
//  Fig-C
//
//  Created by maaz tausif on 20/02/2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var lblItem: UILabel!
    let bgColorView = UIView()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgColorView.backgroundColor =  .white
        self.selectedBackgroundView = bgColorView
        lblItem.textColor = UIColor(hexString: "#5E338C")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
