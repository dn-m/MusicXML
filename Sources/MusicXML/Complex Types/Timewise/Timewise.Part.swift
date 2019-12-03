//
//  Timewise.Part.swift
//  MusicXML
//
//  Created by James Bean on 8/7/19.
//

import XMLCoder

extension Timewise {
    // In either format, the part element has an id attribute that
    // is an IDREF back to a score-part in the part-list. Measures
    // have a required number attribute (going from partwise to
    // timewise, measures are grouped via the number).
    //
    // <!ATTLIST part
    //    id IDREF #REQUIRED
    // >
    public struct Part {
        // MARK: - Instance Properties

        public var id: String
        public var musicData: [MusicData]

    // MARK - Initializers

        public init(id: String, musicData: [MusicData]) {
            self.id = id
            self.musicData = musicData
        }
    }
}

extension Timewise.Part: Equatable {}

extension Timewise.Part: Codable {
    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case id
    }

    public init(from decoder: Decoder) throws {
        // Decode attributes
        let attr = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try attr.decode(String.self, forKey: .id)
        // Decode music data elements
        let musicDataContainer = try decoder.singleValueContainer()
        self.musicData = try musicDataContainer.decode([MusicData].self)
    }
}
