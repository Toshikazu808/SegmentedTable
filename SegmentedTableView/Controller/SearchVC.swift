//
//  SearchVC.swift
//  SegmentedTableView
//
//  Created by Ryan Kanno on 10/4/21.
//

import UIKit

class SearchVC: UIViewController {
   private let searchController = UISearchController()
   @IBOutlet weak var tableView: UITableView!
   private var words = Words.defaultWords
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setupSearchBar()
      setupTableView()
   }
   
   private func setupSearchBar() {
      searchController.searchResultsUpdater = self
      searchController.obscuresBackgroundDuringPresentation = false
      searchController.searchBar.placeholder = "Type a letter"
      navigationItem.searchController = searchController
      definesPresentationContext = true
   }
   
   private func setupTableView() {
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(
         UINib(nibName: SearchCell.id, bundle: nil),
         forCellReuseIdentifier: SearchCell.id)
   }
}

extension SearchVC: UISearchResultsUpdating {
   func updateSearchResults(for searchController: UISearchController) {
      if let text = searchController.searchBar.text?.lowercased(), text.count > 0 {
         words = words.filter { $0.first == text.first }
      } else {
         words = Words.defaultWords
      }
      tableView.reloadData()
   }
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      words.count
   }
   
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 30
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(
         withIdentifier: SearchCell.id,
         for: indexPath) as! SearchCell
      cell.configure(word: words[indexPath.row])
      return cell
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
   }
}
