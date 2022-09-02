//
//  DataEx.swift
//  GzipDecompress
//
//  Created by HwangByungJo  on 2022/09/02.
//

import Foundation

extension Data {

    var eucKrString: String? {
        return self.toString(encoding: String.Encoding(rawValue: 0x80000422))
    }

    func toString(encoding: String.Encoding = .utf8) -> String? {
        return String(data: self, encoding: encoding) ?? nil
    }
}
