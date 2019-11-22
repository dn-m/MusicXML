//
//  XCTestHelpers.swift
//  MusicXML
//
//  Created by James Bean on 7/25/19.
//

import XCTest
import XMLCoder

extension XCTestCase {
    func assertDecoded<T: Decodable & Equatable>(_ xmlString: String, equals expected: T) throws {
        let decoded = try XMLDecoder().decode(T.self, from: xmlString.data(using: .utf8)!)
        XCTAssertEqual(decoded, expected)
    }

    func testRoundTrip <Value: Codable & Equatable>(
        _ value: Value,
        rootKey: String = "container",
        loggingEncoded: Bool = false
    ) throws {
        let encoder = XMLEncoder()
        encoder.outputFormatting = .prettyPrinted
        let encoded = try encoder.encode(value, withRootKey: rootKey)
        if loggingEncoded { print(String(data: encoded, encoding: .utf8)!) }
        let decoded = try XMLDecoder().decode(Value.self, from: encoded)
        XCTAssertEqual(decoded, value)
    }
}
