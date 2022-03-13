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

    init(dataFromNetwork: AnyObject) {
        let data = JSON(dataFromNetwork)
        let status: Int = data["status"].intValue

        switch status {
        case 1:
            success = true
            self.data = data["data"]
        case 0:
            success = false

            let errorData = data["data"]
            let errorCode = errorData["error_code"].string
            let errorMessage = errorData["error_description"].string

        default:
            success = false
            error = NSError(domain: APIConstants.DOMAIN, code: APIConstants.SERVER_ERROR, userInfo: nil)
        }
    }
}
