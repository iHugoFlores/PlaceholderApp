//
//  CollectionController.swift
//  Placeholder
//
//  Created by Hugo Flores Perez on 4/4/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit

class CollectionController: UIViewController, TabNotification {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = CollectionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.identifier)
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        viewModel.root = collectionView
        viewModel.performSegue = self.performSegue
    }
    
    func updateDataFromRoot(data photos: [Photo]?) {
        viewModel.data = photos
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.invalidateLayout()
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
