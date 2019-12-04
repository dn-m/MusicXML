//
//  PrintStyleAlignObject.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

/// The empty-print-style-align-object type represents an empty element with print-object and
/// print-style-align attribute groups.
public struct PrintStyleAlignObject {
    // MARK: - Instance Properties

    public let printObject: Bool?
    public let printStyleAlign: PrintStyleAlign

    // MARK: - Initializers

    public init(printObject: Bool? = nil, printStyleAlign: PrintStyleAlign = PrintStyleAlign()) {
        self.printObject = printObject
        self.printStyleAlign = printStyleAlign
    }
}

extension PrintStyleAlignObject: Equatable {}
extension PrintStyleAlignObject: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case printObject = "print-object"
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(YesNo(printObject), forKey: .printObject)
        try printStyleAlign.encode(to: encoder)
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        self.printStyleAlign = try PrintStyleAlign(from: decoder)
    }
}
