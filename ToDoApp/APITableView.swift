//
//  APITableView.swift
//  ToDoApp
//
//  Created by Luc on 9/17/21.
//

import UIKit
import SnapKit

class APITableView: UITableViewCell {
    
    var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 10, width: 340, height: 20))
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .justified
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(nameLabel)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
  
}
 required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }

   
}
