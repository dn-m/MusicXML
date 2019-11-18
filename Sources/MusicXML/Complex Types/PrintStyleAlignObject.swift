//
//  PrintStyleAlignObject.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The empty-print-style-align-object type represents an empty element with print-object and
/// print-style-align attribute groups.
public struct PrintStyleAlignObject {
    public let printObject: Bool?
    public let printStyleAlign: PrintStyleAlign

    public init(printObject: Bool? = nil, printStyleAlign: PrintStyleAlign = PrintStyleAlign()) {
        self.printObject = printObject
        self.printStyleAlign = printStyleAlign
    }
}

extension PrintStyleAlignObject: Equatable { }
extension PrintStyleAlignObject: Codable {
    private enum CodingKeys: String, CodingKey {
        case printObject = "print-object"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try self.printStyleAlign.encode(to: encoder)
        try container.encodeIfPresent(printObject, forKey: .printObject)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        self.printStyleAlign = try PrintStyleAlign(from: decoder)
    }
}
