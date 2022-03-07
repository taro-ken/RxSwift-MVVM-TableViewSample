//
//  QiitaArticleViewModel.swift
//  RxSwift-MVVM-TableViewSample
//
//  Created by 木元健太郎 on 2022/03/07.
//


import Foundation
import RxSwift
import RxCocoa

final class QiitaArticleViewModel {
    private var disposeBag = DisposeBag()
    
    var articles = BehaviorRelay<[QiitaArticleModel]>(value: [])
    
    func requestQiitaArticle() {
        guard let url = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=20") else { return }
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.rx.response(request: urlRequest)
            .subscribe { [weak self] response, data in
                
                guard let articles = try? JSONDecoder().decode([QiitaArticleModel].self, from: data) else { return }
                
                self?.articles.accept(articles)
                
            } onError: { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)
    }
}
