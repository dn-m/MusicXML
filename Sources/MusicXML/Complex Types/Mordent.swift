//
//  Mordent.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The mordent type is used for both represents the mordent sign with the vertical line and the
/// inverted-mordent sign without the line. The long attribute is "no" by default.
public struct Mordent {
    public let emptyTrillSound: EmptyTrillSound?
    public let long: Bool?
    public let approach: AboveBelow?
    public let departure: AboveBelow?
}

extension Mordent: Equatable { }
extension Mordent: Codable { }
