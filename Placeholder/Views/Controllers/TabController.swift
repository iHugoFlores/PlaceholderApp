//
//  TabController.swift
//  Placeholder
//
//  Created by Hugo Flores Perez on 4/4/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit

protocol TabNotification {
    func updateDataFromRoot(data photos: [Photo]?)
}

class TabController: UITabBarController {
    
    let spinnerView: SpinnerView = SpinnerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData()
    }
    
    func downloadData() {
        spinnerView.showSpinner(in: self.view)
        PhotosAPI.getMockData(onDone: downloadHandler(data:))
    }
    
    func downloadHandler(data arr: [Photo]?) {
        spinnerView.stopSpinner()
        
        var vc = self.viewControllers?[0] as! UINavigationController
        var view = vc.viewControllers.first as! TabNotification
        view.updateDataFromRoot(data: arr)

        vc = self.viewControllers?[1] as! UINavigationController
        view = vc.viewControllers.first as! TabNotification
        view.updateDataFromRoot(data: arr)
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
