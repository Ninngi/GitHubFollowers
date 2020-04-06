//
//  GFError.swift
//  GHFollowers
//
//  Created by Patryk Pawlak on 06/04/2020.
//  Copyright © 2020 Patryk Pawlak. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invaludUsername    = "This username created ab invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data recived from the server was invalid. Please try again."
}
