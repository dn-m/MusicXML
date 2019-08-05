//
//  Partwise.swift
//  MusicXML
//
//  Created by James Bean on 8/5/19.
//

/// The `partwise` traversal of a MusicXML score.
public struct Partwise: Equatable {

    // MARK: - Instance Properties

    // MARK: Elements
    
    public var work: Work?
    public var movementNumber: String?
    public var movementTitle: String?
    public var identification: Identification?
    public var defaults: Defaults?
    public var credits: [Credit]?
    public var partList: PartList
    public var parts: [Part]
}

extension Partwise {

    // MARK: - Nested Types

    // In either format, the part element has an id attribute that
    // is an IDREF back to a score-part in the part-list. Measures
    // have a required number attribute (going from partwise to
    // timewise, measures are grouped via the number).
    //
    // <!ATTLIST part
    //    id IDREF #REQUIRED
    // >
    public struct Part: Equatable {

        // MARK: - Properties

        // MARK: Attributes

        public var id: String

        // MARK: Elements

        public var measures: [Measure]

        // MARK: - Initializers

        /// Creates a `Partwise.Part` with the given `id` and array of `measures`.
        public init(id: String, measures: [Measure]) {
            self.id = id
            self.measures = measures
        }
    }

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
    public struct Measure: Equatable {
        public var number: Int
        public var text: String?
        public var implicit: Bool?
        public var nonControlling: Bool?
        public var width: Tenths?
        public var optionalUniqueID: Int?
        public var musicData: [MusicData]
    }
}

extension Partwise: Codable {

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case work
        case movementNumber = "movement-number"
        case movementTitle = "movement-title"
        case identification
        case defaults
        case credits = "credit"
        case partList = "part-list"
        case parts = "part"
    }
}

extension Partwise.Part: Codable {

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case id
        case measures = "measure"
    }
}

extension Partwise.Measure: Codable {

    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case number
        case text
        case implicit
        case nonControlling = "non-controlling"
        case width
        case optionalUniqueID = "optional-unique-id"
        case musicData
    }

    public init(from decoder: Decoder) throws {
        // Decode attributes
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try keyedContainer.decode(Int.self, forKey: .number)
        self.text = nil
        self.implicit = nil
        self.nonControlling = nil
        self.width = nil
        self.optionalUniqueID = nil

        let container = try decoder.singleValueContainer()
        self.musicData = try container.decode([MusicData].self)
    }
}
