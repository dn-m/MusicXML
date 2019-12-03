//
//  Partwise.Part.swift
//  MusicXML
//
//  Created by James Bean on 8/7/19.
//

extension Partwise {
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
}

extension Partwise.Part: Equatable {}

extension Partwise.Part: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case id
        case measures = "measure"
    }
}
