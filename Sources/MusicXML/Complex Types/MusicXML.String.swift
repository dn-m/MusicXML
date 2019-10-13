//
//  MusicXML.String.swift
//  MusicXML
//
//  Created by James Bean on 5/28/19.
//

extension MusicXML {
    /// The string type is used with tablature notation, regular notation (where it is often
    /// circled), and chord diagrams. String numbers start with 1 for the highest string.
    public struct String {

        // MARK: - Instance Properties

        // MARK: Value

        public let value: Int

        // MARK: One-off Attributes

        public let placement: AboveBelow?

        // MARK: Attribute Groups

        public let printStyle: PrintStyle

        // MARK: - Initializers

        public init(
            _ value: Int = 1,
            placement: AboveBelow? = nil,
            printStyle: PrintStyle = PrintStyle()
        ) {
            self.value = value
            self.placement = placement
            self.printStyle = printStyle
        }
    }
}

extension MusicXML.String: Equatable { }
extension MusicXML.String: Codable {

    private enum CodingKeys: String, CodingKey {
        case value = ""
        case placement
    }

    public init(from decoder: Decoder) throws {
        // Decode attribute groups
        self.printStyle = try PrintStyle(from: decoder)
        // Decode one-off attributes
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
        // Decode value
        do {
            self.value = try container.decode(Int.self, forKey: .value)
        } catch {
            self.value = 1
        }

    }

    public func encode(to encoder: Encoder) throws {
        fatalError("TODO: MusicXML.String.encode(to:)")
    }
}

extension MusicXML.String: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(value)
    }
}
