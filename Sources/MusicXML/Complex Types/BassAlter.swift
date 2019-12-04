//
//  BassAlter.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The bass-alter type represents the chromatic alteration of the bass of the current chord within
/// the harmony element.
public struct BassAlter {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let printObject: Bool?
    public let location: LeftRight?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK: Value

    public let value: Double

    // MARK: - Initializers

    public init(_ value: Double, printObject: Bool? = nil, printStyle: PrintStyle = PrintStyle(), location: LeftRight? = nil) {
        self.value = value
        self.printObject = printObject
        self.printStyle = printStyle
        self.location = location
    }
}

extension BassAlter: Equatable {}
extension BassAlter: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case value = ""
        case printObject = "print-object"
        case location
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(Double.self, forKey: .value)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        self.printStyle = try PrintStyle(from: decoder)
        self.location = try container.decodeIfPresent(LeftRight.self, forKey: .location)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encodeIfPresent(YesNo(printObject), forKey: .printObject)
        try printStyle.encode(to: encoder)
        try container.encodeIfPresent(location, forKey: .location)
    }
}

extension BassAlter: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self.init(value)
    }
}

import XMLCoder
extension BassAlter: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.value:
            return .element
        default:
            return .attribute
        }
    }
}
