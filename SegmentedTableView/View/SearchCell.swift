//
//  NumbersCell.swift
//  SegmentedTableView
//
//  Created by Ryan Kanno on 10/4/21.
//

import UIKit

class SearchCell: UITableViewCell {
   static let id = "SearchCell"
   @IBOutlet weak var label: UILabel!
   
   override func awakeFromNib() {
      super.awakeFromNib()
      backgroundColor = .green
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }
   
   func configure(word: String) {
      label.text = word
   }
}
