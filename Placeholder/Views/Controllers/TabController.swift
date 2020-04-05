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
        PhotosAPI.downloadPhotoData(onDone: downloadHandler(data:))
    }
    
    func downloadHandler(data arr: [Photo]?) {
        spinnerView.stopSpinner()

        if arr == nil {
            let alert = UIAlertController(title: "Error", message: "Error Downloading the Data", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.cancel, handler: { action in
                self.downloadData()
            }))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        var vc = self.viewControllers?[0] as! UINavigationController
        var view = vc.viewControllers.first as! TabNotification
        view.updateDataFromRoot(data: arr)

        vc = self.viewControllers?[1] as! UINavigationController
        view = vc.viewControllers.first as! TabNotification
        view.updateDataFromRoot(data: arr)
    }

}
