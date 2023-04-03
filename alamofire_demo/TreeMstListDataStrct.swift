//
//  TreeMstListDataStrct.swift
//  alamofire_demo
//
//  Created by orenet on 13/03/23.
//

import Foundation
//struct TreeMstList: Codable {
//    let treeCd: Int
//    let localName: String
//    let scientificName: String
//    let description: String
//    let remark: String
//    let isActive: Int
//    let deActiveDate: String
//    let addedBy: String
//    let addedDate: String
//    let updatedBy: String
//    let specie: String
//    let updatedDate: String?
//}

struct Tree: Codable {
    let TreeCd: Int?
    let LocalName: String?
    let ScientificName: String?
    let Specie: String?
    let Description: String?
    let IsActive: Int?
    let AddedBy: String?
    let AddedDate: String?
    let UpdatedBy: String?
    let UpdatedDate: String?
    let Remark: String?
    let DeActiveDate: String?
}




