//
//  Score.Measure.swift
//  MusicXML
//
//  Created by James Bean on 12/18/18.
//

extension MusicXML.Score {

    // MARK: - Measure

    // > The implicit attribute is set to "yes" for measures where
    // > the measure number should never appear, such as pickup
    // > measures and the last half of mid-measure repeats. The
    // > value is "no" if not specified.
    //
    // > The non-controlling attribute is intended for use in
    // > multimetric music like the Don Giovanni minuet. If set
    // > to "yes", the left barline in this measure does not
    // > coincide with the left barline of measures in other
    // > parts. The value is "no" if not specified.
    // > In partwise files, the number attribute should be the same
    // > for measures in different parts that share the same left
    // > barline. While the number attribute is often numeric, it
    // > does not have to be. Non-numeric values are typically used
    // > together with the implicit or non-controlling attributes
    // > being set to "yes". For a pickup measure, the number
    // > attribute is typically set to "0" and the implicit attribute
    // > is typically set to "yes".
    // > If measure numbers are not unique within a part, this can
    // > cause problems for conversions between partwise and timewise
    // > formats. The text attribute allows specification of displayed
    // > measure numbers that are different than what is used in the
    // > number attribute. This attribute is ignored for measures
    // > where the implicit attribute is set to "yes". The text
    // > attribute for a measure element has at least one character.
    // > Further details about measure numbering can be specified
    // > using the measure-numbering element defined in the
    // > direction.mod file.
    // > Measure width is specified in tenths. These are the
    // > global tenths specified in the scaling element, not
    // > local tenths as modified by the staff-size element.
    // > The width covers the entire measure from barline
    // > or system start to barline or system end.
    //
    // <!ATTLIST measure
    //     number CDATA #REQUIRED
    //     text CDATA #IMPLIED
    //     implicit %yes-no; #IMPLIED
    //     non-controlling %yes-no; #IMPLIED
    //     width %tenths; #IMPLIED
    //     %optional-unique-id;
    // >
    public struct Measure {

        // TODO: let number: Int
        let traversal: Traversal

        public init(from decoder: Decoder) throws {
            var container = try decoder.unkeyedContainer()
            self.traversal = try container.decode(Traversal.self)
        }
    }
}

extension MusicXML.Score.Measure {

    // MARK: - Traversal

    enum Traversal: Decodable, Equatable {

        case partwise(Partwise)
        case timewise(Timewise)

        init(from decoder: Decoder) throws {
            var container = try decoder.unkeyedContainer()
            do {
                self = .partwise(try container.decode(Partwise.self))
            } catch {
                self = .timewise(try container.decode(Timewise.self))
            }
        }
    }
}

extension MusicXML.Score.Measure {

    // MARK: - Partwise

    public struct Partwise: Equatable {
        let number: Int
        let attributes: [MusicXML.Attributes]?
        let text: String?
        let implicit: Bool?
        let nonControlling: Bool?
        let width: Int? // Tenths
        let optionalUniqueID: Int?

        let musicData: MusicXML.MusicData
    }
}

extension MusicXML.Score.Measure {

    // MARK: - Timewise

    #warning("TODO: Build out Measure.Timewise")
    public struct Timewise: Decodable, Equatable {
        let number: Int
        let parts: [MusicXML.Score.Part.Timewise]
    }
}

extension MusicXML.Score.Measure.Partwise: Decodable {

    enum CodingKeys: String, CodingKey {
        case number
        case attributes
        case text
        case implicit
        case nonControlling = "non-controlling"
        case width
        case optionalUniqueID = "optional-unique-id"
    }

    public init(from decoder: Decoder) throws {
        var keyed = try decoder.container(keyedBy: CodingKeys.self)
        var unkeyed = try decoder.unkeyedContainer()
        self.number = try keyed.decode(Int.self, forKey: .number)
        self.attributes = try keyed.decodeIfPresent([MusicXML.Attributes].self, forKey: .attributes)
        self.text = try keyed.decodeIfPresent(String.self, forKey: .text)
        self.implicit = try keyed.decodeIfPresent(Bool.self, forKey: .implicit)
        self.nonControlling = try keyed.decodeIfPresent(Bool.self, forKey: .nonControlling)
        self.width = try keyed.decodeIfPresent(Int.self, forKey: .width)
        self.optionalUniqueID = try keyed.decodeIfPresent(Int.self, forKey: .optionalUniqueID)
        self.musicData = try unkeyed.decode(MusicXML.MusicData.self)
    }
}
