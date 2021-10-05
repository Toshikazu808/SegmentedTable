//
//  LowerCaseCell.swift
//  SegmentedTableView
//
//  Created by Ryan Kanno on 10/4/21.
//

import UIKit

class SectionedCell: UITableViewCell {
   static let id = "LowerCaseCell"
   @IBOutlet weak var label: UILabel!
   
   override func awakeFromNib() {
      super.awakeFromNib()
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }
   
   func configure(letter: String, section: Int) {
      label.text = letter
      switch section {
      case 0:
         backgroundColor = .cyan
      case 1:
         backgroundColor = .brown
      case 2:
         backgroundColor = .green
      default:
         break
      }
   }
}
