//
//  BassAlter.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The bass-alter type represents the chromatic alteration of the bass of the current chord within
/// the harmony element.
public struct BassAlter {
    public let value: Double
    public let printObject: Bool?
    public let printStyle: PrintStyle?
    public let location: LeftRight?
}

extension BassAlter: Equatable { }
extension BassAlter: Decodable { }
