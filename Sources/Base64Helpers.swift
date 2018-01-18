//
//  Base64Helpers.swift
//
//  Copyright (c) 2017-2018 Kimmo Kulovesi
//  https://github.com/arkku/
//

import Foundation

public extension Data {

    /// Encodes the contents to `encoder` as a single string value
    /// using base-64 encoding.
    func base64Encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(base64EncodedString())
    }

}

public extension String {

    /// Returns the contents of this string base-64 encoded.
    func base64Encoded(using encoding: String.Encoding = .utf8, options: Data.Base64EncodingOptions = []) -> String? {
        guard let data = self.data(using: encoding) else { return nil }
        return data.base64EncodedString(options: options)
    }

    /// Interprets the contents of this string as base-64 encoded and
    /// returns the decoded data.
    func base64DecodedData(options: Data.Base64DecodingOptions = []) -> Data? {
        return Data(base64Encoded: self, options: options)
    }

    /// Interprets the contents of this string as base-64 encoded and
    /// returns the decoded data as a string using `encoding`.
    func base64DecodedString(using encoding: String.Encoding = .utf8, options: Data.Base64DecodingOptions = []) -> String? {
        guard let data = base64DecodedData(options: options) else { return nil }
        return String(data: data, encoding: encoding)
    }

}
