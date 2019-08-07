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
    public struct Part: Equatable {
        let id: String
        let musicData: MusicData?
    }
}

extension Timewise.Part: Codable {

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case id
    }

    public init(from decoder: Decoder) throws {
        let keyed = try decoder.container(keyedBy: CodingKeys.self)
        var unkeyed = try decoder.unkeyedContainer()
        self.id = try keyed.decode(String.self, forKey: .id)
        self.musicData = try unkeyed.decode(MusicData.self)
    }
}
