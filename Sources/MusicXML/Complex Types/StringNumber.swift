//
//  StringNumber.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The string-number type indicates a string number. Strings are numbered from high to low, with 1
/// being the highest pitched string.
public struct StringNumber {
    public let value: Int

    public init(value: Int) {
        self.value = value
    }
}

extension StringNumber: Equatable { }
extension StringNumber: Codable { }
