//
//  Score.Part.swift
//  MusicXML
//
//  Created by James Bean on 12/18/18.
//

extension MusicXML.Score {

    // MARK: - Part

    public struct Part: Equatable {
        let traversal: Traversal
    }
}

extension MusicXML.Score.Part {

    // MARK: - Traversal

    enum Traversal: Equatable {
        case partwise(Partwise)
        case timewise(Timewise)
    }
}

extension MusicXML.Score.Part {

    // MARK: - Partwise

    // In either format, the part element has an id attribute that
    // is an IDREF back to a score-part in the part-list. Measures
    // have a required number attribute (going from partwise to
    // timewise, measures are grouped via the number).
    //
    // <!ATTLIST part
    //    id IDREF #REQUIRED
    // >
    public struct Partwise: Equatable {
        let id: String
        let measures: [MusicXML.Score.Measure.Partwise]
    }
}

extension MusicXML.Score.Part {

    // MARK: - Timewise

    public struct Timewise: Equatable {
        let id: String
        let musicData: [MusicXML.MusicDatum]
    }
}

extension MusicXML.Score.Part: Decodable {

    // MARK: - Decodable

    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.traversal = try container.decode(Traversal.self)
    }
}

extension MusicXML.Score.Part.Traversal: Decodable {

    // MARK: - Traversal

    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        do {
            self = .partwise(try container.decode(MusicXML.Score.Part.Partwise.self))
        } catch {
            self = .timewise(try container.decode(MusicXML.Score.Part.Timewise.self))
        }
    }
}

extension MusicXML.Score.Part.Partwise: Decodable {

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case id
        case measures = "measure"
    }

    public init(from decoder: Decoder) throws {
        print("attempt to decode part partwise")
        let keyed = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try keyed.decode(String.self, forKey: .id)
        self.measures = try keyed.decode([MusicXML.Score.Measure.Partwise].self, forKey: .measures)
    }
}

extension MusicXML.Score.Part.Timewise: Decodable {

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case id
    }

    public init(from decoder: Decoder) throws {
        let keyed = try decoder.container(keyedBy: CodingKeys.self)
        var unkeyed = try decoder.unkeyedContainer()
        self.id = try keyed.decode(String.self, forKey: .id)
        self.musicData = try unkeyed.decode([MusicXML.MusicDatum].self)
    }
}
