//
//  StringEx.swift
//  GzipDecompress
//
//  Created by HwangByungJo  on 2022/09/02.
//

import Foundation
import Gzip

extension String {

    var decodeBase64Data: Data? {
        return Data(base64Encoded: self, options: .ignoreUnknownCharacters)
    }

    var gunzipped: String? {
        guard let gzipData = self.decodeBase64Data else { return nil }
        let decompressedData = try? gzipData.gunzipped()
        return decompressedData?.eucKrString
    }
}
