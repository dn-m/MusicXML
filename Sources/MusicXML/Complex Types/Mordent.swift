//
//  Mordent.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The mordent type is used for both represents the mordent sign with the vertical line and the
/// inverted-mordent sign without the line. The long attribute is "no" by default.
public struct Mordent {
    public let value: PrintStyleTrillSound?
    public let long: Bool?
    public let approach: AboveBelow?
    public let departure: AboveBelow?

    public init(
        value: PrintStyleTrillSound? = nil,
        long: Bool? = nil,
        approach: AboveBelow? = nil,
        departure: AboveBelow? = nil
    ) {
        self.value = value
        self.long = long
        self.approach = approach
        self.departure = departure
    }
}

extension Mordent: Equatable { }
extension Mordent: Codable { }
