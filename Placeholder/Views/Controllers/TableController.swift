//
//  TableController.swift
//  Placeholder
//
//  Created by Hugo Flores Perez on 4/4/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit

class TableController: UIViewController, TabNotification {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        viewModel.performSegue = self.performSegue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    func updateDataFromRoot(data photos: [Photo]?) {
        viewModel.data = photos
        tableView.reloadData()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? DetailController
        vc?.viewModel.photo = viewModel.valueToPass
        viewModel.valueToPass = nil
        tabBarController?.tabBar.isHidden = true
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return viewModel.valueToPass != nil
    }

}
