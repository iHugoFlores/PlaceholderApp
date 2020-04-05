//
//  TableViewModel.swift
//  Placeholder
//
//  Created by Hugo Flores Perez on 4/4/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit

class TableViewModel: GenericDataSource<Photo>, UITableViewDataSource, UITableViewDelegate {
    
    private let segueIdentifier: String = "tableToDetails"
    var performSegue: ((String, IndexPath) -> ())?
    var valueToPass: Photo?

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifier, for: indexPath) as! TableCell
        
        cell.viewModel.photo = data![indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        valueToPass = data?[indexPath.row]
        performSegue!(segueIdentifier, indexPath)
    }

}
