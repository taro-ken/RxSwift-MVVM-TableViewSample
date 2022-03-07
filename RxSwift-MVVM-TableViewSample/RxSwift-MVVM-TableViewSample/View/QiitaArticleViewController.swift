//
//  QiitaArticleViewController.swift
//  RxSwift-MVVM-TableViewSample
//
//  Created by 木元健太郎 on 2022/03/07.
//

import UIKit
import RxSwift

final class QiitaArticleViewController: UIViewController {
    
    private var viewModel = QiitaArticleViewModel()
    private var disposeBag = DisposeBag()
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: QiitaArticleCell.identifier, bundle: nil), forCellReuseIdentifier: QiitaArticleCell.identifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.requestQiitaArticle()
    }
    
    private func bind() {
        viewModel.articles
            .bind(to: tableView.rx.items(cellIdentifier: QiitaArticleCell.identifier, cellType: QiitaArticleCell.self)) { row, element, cell in
                cell.configureCell(model: element, row: row)
            }
            .disposed(by: disposeBag)
        
    }
}
