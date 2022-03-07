//
//  QiitaArticleModel.swift
//  RxSwift-MVVM-TableViewSample
//
//  Created by 木元健太郎 on 2022/03/07.
//

import Foundation

struct QiitaArticleModel: Codable {
    let title: String
    let url: String
    let user: User
}

// MARK: - User
struct User: Codable {
    let id: String
    let profileImageURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case profileImageURL = "profile_image_url"
    }
}
