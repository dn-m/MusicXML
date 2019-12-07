//
//  Dynamics.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// Dynamics can be associated either with a note or a general musical direction. To avoid
/// inconsistencies between and amongst the letter abbreviations for dynamics (what is sf vs. sfz,
/// standing alone or with a trailing dynamic that is not always piano), we use the actual letters
/// as the names of these dynamic elements. The other-dynamics element allows other dynamic marks
/// that are not covered here, but many of those should perhaps be included in a more general
/// musical direction element. Dynamics elements may also be combined to create marks not covered by
/// a single element, such as sfmp. These letter dynamic symbols are separated from crescendo,
/// decrescendo, and wedge indications. Dynamic representation is inconsistent in scores. Many
/// things are assumed by the composer and left out, such as returns to original dynamics.
/// Systematic representations are quite complex: for example, Humdrum has at least 3 representation
/// formats related to dynamics. The MusicXML format captures what is in the score, but does not
/// try to be optimal for analysis or synthesis of dynamics.
public struct Dynamics {
    // MARK: - Instance Properties

    // MARK: Values

    public let values: [Dynamic]

    // MARK: Attribute Groups

    public let printStyleAlign: PrintStyleAlign
    public let textDecoration: TextDecoration

    // MARK: Attributes

    public let placement: AboveBelow?
    public let enclosure: EnclosureShape?
}

extension Dynamics {
    // MARK: - Initializers

    public init(
        _ values: [Dynamic],
        printStyleAlign: PrintStyleAlign = PrintStyleAlign(),
        placement: AboveBelow? = nil,
        textDecoration: TextDecoration = TextDecoration(),
        enclosure: EnclosureShape? = nil
    ) {
        self.values = values
        self.printStyleAlign = printStyleAlign
        self.placement = placement
        self.textDecoration = textDecoration
        self.enclosure = enclosure
    }
}

extension Dynamics: Equatable {}
extension Dynamics: Codable {
    // MARK: - Codable

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        // Decode values
        self.values = try decoder.collectArray()

        // Decode attribute groups
        self.printStyleAlign = try PrintStyleAlign(from: decoder)
        self.textDecoration = try TextDecoration(from: decoder)

        // Decode one-off attributes
        let attributesContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.placement = try attributesContainer.decodeIfPresent(AboveBelow.self, forKey: .placement)
        self.enclosure = try attributesContainer.decodeIfPresent(EnclosureShape.self, forKey: .enclosure)
    }
}

import XMLCoder
extension Dynamics: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.placement:
            return .attribute
        case CodingKeys.enclosure:
            return .attribute
        default:
            return .element
        }
    }
}
