//
//  ViewController.swift
//  SegmentedTableView
//
//  Created by Ryan Kanno on 10/4/21.
//

import UIKit

class HomeVC: UIViewController {
   @IBOutlet weak var tableView: UITableView!
   private let titles = ["Lowercase", "Uppercase", "Numbers"]
   private let data = [
      ["a", "b", "c", "d", "e"],
      ["A", "B", "C", "D", "E"],
      ["1", "2", "3", "4", "5"]
   ]
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setupTableView()
   }
   
   private func setupTableView() {
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(
         UINib(nibName: SectionedCell.id, bundle: nil),
         forCellReuseIdentifier: SectionedCell.id)
   }
   
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
      return titles.count
   }
   
   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return titles[section]
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return data[section].count
   }
   
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 35
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(
         withIdentifier: SectionedCell.id,
         for: indexPath) as! SectionedCell
      cell.configure(
         letter: data[indexPath.section][indexPath.row],
         section: indexPath.section)
      return cell
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
      let section = indexPath.section
      let row = indexPath.row
      print("\nsection: \(section)")
      print("\nrow: \(row)")
   }
}
