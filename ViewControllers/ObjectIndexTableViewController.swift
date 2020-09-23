//
//  ObjectIndexTableViewController.swift
//  EnumTable
//
//  Created by Byron Mackay on 9/23/20.
//

import UIKit

class ObjectIndexTableViewController: UITableViewController {
    
    private let presenter = ObjectIndexPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadCells()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.cells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = presenter.cells[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = cellData.title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let showPresenter = presenter.getShowPresenter(at: indexPath.row) else {
            return
        }
        let showViewController = ShowTableViewController()
        showViewController.title = presenter.cells[indexPath.row].title
        showViewController.presenter = showPresenter
        navigationController?.pushViewController(showViewController, animated: true)
    }

}
