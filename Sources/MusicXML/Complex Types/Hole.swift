//
//  Hole.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The hole type represents the symbols used for woodwind and brass fingerings as well as other
/// notations.
public struct Hole {
    // MARK: - Instance Properties

    /// The content of the optional hole-type element indicates what the hole symbol represents in
    /// terms of instrument fingering or other techniques.
    public let holeType: String?
    /// The hole-closed type represents whether the hole is closed, open, or half-open. The optional
    /// location attribute indicates which portion of the hole is filled in when the element value
    /// is half.
    public let holeClosed: HoleClosed
    /// The optional hole-shape element indicates the shape of the hole symbol; the default is a
    /// circle.
    public let holeShape: String?
    public let printStyle: PrintStyle
    public let placement: AboveBelow?

    // MARK - Initializers

    public init(holeType: String? = nil, holeClosed: HoleClosed, holeShape: String? = nil, printStyle: PrintStyle = PrintStyle(), placement: AboveBelow? = nil) {
        self.holeType = holeType
        self.holeClosed = holeClosed
        self.holeShape = holeShape
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension Hole: Equatable {}
extension Hole: Codable {
    enum CodingKeys: String, CodingKey {
        case holeType
        case holeClosed
        case holeShape
        case placement
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(holeType, forKey: .holeType)
        try container.encode(holeClosed, forKey: .holeClosed)
        try container.encodeIfPresent(holeShape, forKey: .holeShape)
        try printStyle.encode(to: encoder)
        try container.encodeIfPresent(placement, forKey: .placement)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        holeType = try container.decodeIfPresent(String.self, forKey: .holeType)
        holeClosed = try container.decode(HoleClosed.self, forKey: .holeClosed)
        holeShape = try container.decodeIfPresent(String.self, forKey: .holeShape)
        printStyle = try PrintStyle(from: decoder)
        placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    }
}
