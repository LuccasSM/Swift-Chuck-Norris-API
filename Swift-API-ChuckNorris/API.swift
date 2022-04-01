//
//  File.swift
//  Swift-API-ChuckNorris
//
//  Created by Luccas Santana Marinho on 01/04/22.
//

import Foundation

struct Api: Decodable {
    var icon_url: String
    var id: String
    var url: String
    var value: String
}
