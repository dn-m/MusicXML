//
//  EndingNumber.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The ending-number type is used to specify either a comma-separated list of positive integers
/// without leading zeros, or a string of zero or more spaces. It is used for the number attribute
/// of the ending element. The zero or more spaces version is used when software knows that an
/// ending is present, but cannot determine the type of the ending.
public struct EndingNumber {
    let value: String
}

extension EndingNumber: Equatable { }
extension EndingNumber: Codable { }
