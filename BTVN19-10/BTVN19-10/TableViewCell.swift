//
//  TableViewCell.swift
//  BTVN19-10
//
//  Created by Dương Văn Cường on 21/10/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var btnPut: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgAvtatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
