//
//  ListModel.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-14.
//

import Foundation

struct ListModel: Decodable {
  let title: String
  let description: String
  let movies: [Movies]
}

struct Movies: Decodable {
  let id: String
  let title: String
  let releaseYear: String
}
