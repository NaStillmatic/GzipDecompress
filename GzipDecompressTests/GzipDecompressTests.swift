//
//  GzipDecompressTests.swift
//  GzipDecompressTests
//
//  Created by HwangByungJo  on 2022/09/02.
//

import XCTest
@testable import GzipDecompress

class GzipDecompressTests: XCTestCase {

  override class func setUp() {
    super.setUp()
  }

  override class func tearDown() {
    super.tearDown()
  }

  func testGzipDecompress() throws {

    let gzipString =
    """
    
    """

    if gzipString.isEmpty {
      XCTFail("gzipString.isEmpty")
    }
    let plainString = gzipString.gunzipped
    let isSuccess = plainString != nil
    print(plainString ?? "")
    XCTAssertTrue(isSuccess)
  }
}
