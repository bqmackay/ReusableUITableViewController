//
//  ViewController.swift
//  EnumTable
//
//  Created by Byron Mackay on 9/22/20.
//

import UIKit

class ShowTableViewController: UITableViewController {
    
    var presenter: EnumPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.loadCells()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.cells.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = presenter.cells[indexPath.row]
        
        switch cellData.cellType {
        case .text:
            let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
            cell.textLabel?.text = cellData.title
            cell.detailTextLabel?.text = cellData.value as? String
            return cell
        case .image:
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = cellData.title
            cell.imageView?.image = cellData.value as? UIImage
            return cell
        case .toggle:
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = cellData.title
            cell.accessoryType = .checkmark
            cell.accessoryView = UISwitch()
            return cell
        }
    }


}

protocol EnumPresenterProtocol {
    var cells: [Cell] { get } 
    func loadCells()
}
