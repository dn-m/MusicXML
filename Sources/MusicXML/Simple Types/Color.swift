//
//  Color.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The color type indicates the color of an element. Color may be represented as hexadecimal RGB
/// triples, as in HTML, or as hexadecimal ARGB tuples, with the A indicating alpha of transparency.
/// An alpha value of 00 is totally transparent; FF is totally opaque. If RGB is used, the A value
/// is assumed to be FF.  For instance, the RGB value "#800080" represents purple. An ARGB value of
/// "#40800080" would be a transparent purple.  As in SVG 1.1, colors are defined in terms of the
/// sRGB color space (IEC 61966).
public struct Color {
    public let hexValue: Int

    public init(hexValue: Int) {
        self.hexValue = hexValue
    }

    /// Create a `Color` with the given `hex` string.
    public init?(hexString: String) {
        guard let hex = Int(hexString.droppingLeadingHash(), radix: 16) else { return nil }
        self.init(hexValue: hex)
    }
}

extension Color: Equatable {}
extension Color: Codable {
    private enum CodingKeys: String, CodingKey {
        case hexValue = ""
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        guard let color = Color(hexString: try container.decode(String.self)) else {
            throw DecodingError.typeMismatch(
                Color.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Could not create a `Color` from the given XML string."
                )
            )
        }
        self = color
    }

    public func encode(to encoder: Encoder) throws {
        try String(hexValue, radix: 16, uppercase: true).encode(to: encoder)
    }
}

extension String {
    // Prepare this string for conversion to hexadecimally-represented integer value by dropping
    // the leading octothorpe.
    func droppingLeadingHash() -> Substring { first == "#" ? dropFirst() : self[...] }
}
