//
//  QiitaArticleCell.swift
//  RxSwift-MVVM-TableViewSample
//
//  Created by 木元健太郎 on 2022/03/07.
//

import UIKit

final class QiitaArticleCell: UITableViewCell {
    
    static var identifier = "QiitaArticleCell"
    
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userNameLabel.text = nil
        titleLabel.text = nil
    }
    
    func configureCell(model: QiitaArticleModel, row: Int) {
        userNameLabel.text = model.user.id
        titleLabel.text = model.title
    }
    
}
