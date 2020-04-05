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
        tableView.dataSource = viewModel
        tableView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        //viewController.test()
    }
    
    func updateDataFromRoot(data photos: [Photo]?) {
        viewModel.data = photos
        tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}