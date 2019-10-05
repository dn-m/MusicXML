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

    public init(value: Double, printObject: Bool? = nil, printStyle: PrintStyle? = nil, location: LeftRight? = nil) {
        self.value = value
        self.printObject = printObject
        self.printStyle = printStyle
        self.location = location
    }
}

extension BassAlter: Equatable { }
extension BassAlter: Codable { }
