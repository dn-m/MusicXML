//
//  Dashes.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The dashes type represents dashes, used for instance with cresc. and dim. marks.
public struct Dashes {
    // MARK: - Instance Properties

    // MARK: Attribute Groups

    public let dashedFormatting: DashedFormatting

    // MARK: One-off Attributes

    public let type: StartStopContinue

    // MARK: - Initializers

    public init(
        type: StartStopContinue,
        dashedFormatting: DashedFormatting = DashedFormatting()
    ) {
        self.type = type
        self.dashedFormatting = dashedFormatting
    }
}

extension Dashes: Equatable {}
extension Dashes: Codable {
    public init(from decoder: Decoder) throws {
        // Decode attribute groups
        self.dashedFormatting = try DashedFormatting(from: decoder)
        // Decode one-off attributes
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(StartStopContinue.self, forKey: .type)
    }
}
