//
//  TreesDataResponse.swift
//  alamofire_demo
//
//  Created by orenet on 13/03/23.
//

import Foundation


struct TreeResponse: Codable {
    let error: Bool
    let TreeMstList: [Tree]
    let message: String?
}
