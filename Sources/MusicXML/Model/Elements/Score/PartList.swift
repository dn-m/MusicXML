//
//  PartList.swift
//  MusicXML
//
//  Created by James Bean on 12/21/18.
//

// > The part-list identifies the different musical parts in
// > this movement. Each part has an ID that is used later
// > within the musical data. Since parts may be encoded
// > separately and combined later, identification elements
// > are present at both the score and score-part levels.
// > There must be at least one score-part, combined as
// > desired with part-group elements that indicate braces
// > and brackets. Parts are ordered from top to bottom in
// > a score based on the order in which they appear in the
// > part-list.
//
// > Each MusicXML part corresponds to a track in a Standard
// > MIDI Format 1 file. The score-instrument elements are
// > used when there are multiple instruments per track.
// > The midi-device element is used to make a MIDI device
// > or port assignment for the given track or specific MIDI
// > instruments. Initial midi-instrument assignments may be
// > made here as well.
// > The part-name-display and part-abbreviation-display
// > elements are defined in the common.mod file, as they can
// > be used within both the score-part and print elements.
//
// <!ELEMENT part-list (part-group*, score-part,
//    (part-group | score-part)*)>
public struct PartList: Equatable {
    public enum Element: Decodable, Equatable {
        case group(PartGroup) // PartGroup
        case part(ScorePart)
        enum CodingKeys: String, CodingKey {
            case group
            case part
        }
        public init(from decoder: Decoder) throws {
            let keyed = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self = .group(try keyed.decode(PartGroup.self, forKey: .group))
            } catch {
                self = .part(try keyed.decode(ScorePart.self, forKey: .part))
            }
        }
    }
    let elements: [Element]
}

extension PartList {

    // MARK: Nested Types


}


extension PartList: Decodable {

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case parts = "score-part"
    }

    public init(from decoder: Decoder) throws {
        var unkeyed = try decoder.unkeyedContainer()
        self.elements = try unkeyed.decode([Element].self)
    }
}
