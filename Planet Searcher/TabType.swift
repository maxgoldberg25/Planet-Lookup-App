//
//  ContentView.swift
//  Webster
//
//  Created by Arthur Roolfs on 11/26/22.
//

import Foundation
import SwiftUI

enum TabType: Int, CaseIterable {
    case image, raw, webview, stocks
    
    func title() -> String {
        switch self {
        case .image:
            return "image".capitalized
        case .raw:
            return "raw".capitalized
        case .webview:
            return "web".capitalized
        case .stocks:
            return "stocks".capitalized
        }
    }
    
    func image() -> String {
        switch self {
        case .image:
            return "image"
        case .raw:
            return "rawHTML"
        case .webview:
            return "webView"
        case .stocks:
            return "stocks"
        }
    }
    
}
