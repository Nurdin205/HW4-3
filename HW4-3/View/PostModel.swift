//
//  PostModel.swift
//  HW4-3
//
//  Created by cpu on 18/4/23.
//

import UIKit



struct PostDatum: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias PostData = [PostDatum]
