//
//  DegreeAlter.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The degree-alter type represents the chromatic alteration for the current degree. If the
/// degree-type value is alter or subtract, the degree-alter value is relative to the degree already
/// in the chord based on its kind element. If the degree-type value is add, the degree-alter is
/// relative to a dominant chord (major and perfect intervals except for a minor seventh). The
/// plus-minus attribute is used to indicate if plus and minus symbols should be used instead of
/// sharp and flat symbols to display the degree alteration; it is no by default.
public struct DegreeAlter {
    public let value: Int
    public let printStyle: PrintStyle
    public let plusMinus: Bool?

    public init(value: Int, printStyle: PrintStyle = PrintStyle(), plusMinus: Bool? = nil) {
        self.value = value
        self.printStyle = printStyle
        self.plusMinus = plusMinus
    }
}

extension DegreeAlter: Equatable { }
extension DegreeAlter: Codable {
    private enum CodingKeys: String, CodingKey {
        case value = ""
        case plusMinus = "plus-minus"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.printStyle = try PrintStyle(from: decoder)
        self.value = try container.decode(Int.self, forKey: .value)
        self.plusMinus = try container.decodeIfPresent(Bool.self, forKey: .plusMinus)
    }
}
