//
//  QiitaArticleCell.swift
//  RxSwift-MVVM-TableViewSample
//
//  Created by 木元健太郎 on 2022/03/07.
//

import UIKit
import Kingfisher

final class QiitaArticleCell: UITableViewCell {
    
    static var identifier = "QiitaArticleCell"
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
   
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userNameLabel.text = nil
        iconImage.image = nil

    }
    
    func configureCell(model: QiitaArticleModel, row: Int) {
        let url = URL(string: model.user.profileImageURL)
        iconImage.kf.setImage(with: url)
        userNameLabel.text = model.user.id
        print(model.url)
    }
    
}
