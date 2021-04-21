//
//  ProductCollectionViewCell.swift
//  PushNotificationSample
//
//  Created by 渕一真 on 2021/04/21.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    
    func configure(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = product.price
    }
}
