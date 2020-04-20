//
//  Base64URLEncodingTests.swift
//
//  Copyright (c) 2017-2018 Kimmo Kulovesi
//  https://github.com/arkku/
//

import XCTest
import Base64URLEncoding

class Base64URLEncodingTests: XCTestCase {

    let testDecoded = "Lorem?ipsum"
    let testEncoded = "TG9yZW0_aXBzdW0"

    func testEncodeString() {
        let encoded = testDecoded.base64URLEncoded()
        XCTAssertEqual(encoded, testEncoded)
    }

    func testDecodeString() {
        let decoded = testEncoded.base64URLDecodedString()
        XCTAssertEqual(decoded, testDecoded)
    }

    func testEncodeEmpty() {
        let decoded = "".base64URLEncoded()
        XCTAssertEqual(decoded, "")
    }

    func testDecodeEmpty() {
        let encoded = "".base64URLDecodedString()
        XCTAssertEqual(encoded, "")
    }

    func testEncodeDecode() {
        let testUpToLength = 1_500
        var testData = Data()

        while testData.count < testUpToLength {
            testData.append(.random(in: .min...(.max)))
            let encoded = testData.base64URLEncodedData()
            let decoded = encoded.base64URLDecodedData()
            XCTAssertEqual(decoded, testData)
        }
    }

}
