//
//  RestResponse.swift
//  MovieDatabaseApp
//
//  Created by Jann Zaplan on 2022-03-11.
//

import Alamofire
import Foundation
import SwiftyJSON

class RestResponse {
    var data: JSON?
    var success: Bool
    var error: NSError?

    init(dataFromNetwork: Data) {
        let data = JSON(dataFromNetwork)
        success = true
        self.data = data
    }
}
