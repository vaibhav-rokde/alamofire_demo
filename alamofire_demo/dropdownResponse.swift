//
//  dropdownResponse.swift
//  alamofire_demo
//
//  Created by orenet on 20/03/23.
//

import Foundation


struct dropdownResponse: Codable {
    let SpecieList: [allSpecie]
}

struct allSpecie: Codable {
    let DropDownCd: Int
    let Dvalue: String
}
