//
//  Forward.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The backup and forward elements are required to coordinate multiple voices in one part,
/// including music on multiple staves. The forward element is generally used within voices and
/// staves. Duration values should always be positive, and should not cross measure boundaries or
/// mid-measure changes in the divisions value.
public struct Forward {
    // MARK: - Instance Properties

    // MARK: Elements

    /// Duration is a positive number specified in division units. This is the intended duration vs.
    /// notated duration (for instance, swing eighths vs. even eighths, or differences in dotted
    /// notes in Baroque-era music). Differences in duration specific to an interpretation or
    /// performance should use the note element's attack and release attributes.
    public let duration: Int
    /// The footnote element specifies editorial information that appears in footnotes in the
    /// printed score. It is defined within a group due to its multiple uses within the MusicXML
    /// schema.
    public let editorialVoice: EditorialVoice?
    /// Staff assignment is only needed for music notated on multiple staves. Used by both notes
    /// and directions. Staff values are numbers, with 1 referring to the top-most staff in a part.
    public let staff: Int?

    // MARK: - Initializers

    public init(duration: Int, editorialVoice: EditorialVoice? = nil, staff: Int? = nil) {
        self.duration = duration
        self.editorialVoice = editorialVoice
        self.staff = staff
    }
}

extension Forward: Equatable {}
extension Forward: Codable {}

import XMLCoder
extension Forward: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        return .element
    }
}
