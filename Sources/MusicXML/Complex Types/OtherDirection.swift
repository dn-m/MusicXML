//
//  OtherDirection.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The other-direction type is used to define any direction symbols not yet in the current version
/// of the MusicXML format. This allows extended representation, though without application
/// interoperability.
public struct OtherDirection {
    public let value: String
    public let printObject: Bool?
    public let printStyleAlign: PrintStyleAlign?

    public init(_ value: String, printObject: Bool? = nil, printStyleAlign: PrintStyleAlign? = nil) {
        self.value = value
        self.printObject = printObject
        self.printStyleAlign = printStyleAlign
    }
}

extension OtherDirection: Equatable { }
extension OtherDirection: Codable {
    enum CodingKeys: String, CodingKey {
        case printObject
        case printStyleAlign
        case value = ""
    }
}
