//
//  ProductListViewController.swift
//  PushNotificationSample
//
//  Created by 渕一真 on 2021/04/20.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let nib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
            collectionView.dataSource = self
        }
    }
    
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var products = [Product]()
    
    @IBAction func didTapAddButton(_ sender: UIBarButtonItem) {
        AlertService.addProductAlert(in: self) { (product) in
            self.products.append(product)
            self.collectionView.reloadData()
        }
    }
    
    @IBAction func didTapSubscribeButton(_ sender: UIBarButtonItem) {
        AlertService.subscribeAlert(in: self)
    }
    
    
}

extension ProductListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        let product = products[indexPath.item]
        cell.configure(with: product)
        return cell
    }
}
