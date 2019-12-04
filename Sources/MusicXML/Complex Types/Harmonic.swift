//
//  Harmonic.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The harmonic type indicates natural and artificial harmonics. Allowing the type of pitch to be
/// specified, combined with controls for appearance/playback differences, allows both the notation
/// and the sound to be represented. Artificial harmonics can add a notated touching-pitch;
/// artificial pinch harmonics will usually not notate a touching pitch. The attributes for the
/// harmonic element refer to the use of the circular harmonic symbol, typically but not always used
/// with natural harmonics.
public struct Harmonic {
    // MARK: - Instance Properties

    // MARK: Elements

    public var naturalArtificial: NaturalArtificial?
    public var baseSoundingTouchingPitch: BaseSoundingTouchingPitch?

    // MARK: Attributes

    public var printObject: Bool?

    public var placement: AboveBelow?

    // MARK: - Attribute Groups

    public var printStyle: PrintStyle

    // MARK: - Initializers

    public init(
        naturalArtificial: NaturalArtificial? = nil,
        baseSoundingTouchingPitch: BaseSoundingTouchingPitch? = nil,
        printObject: Bool? = nil,
        placement: AboveBelow? = nil,
        printStyle: PrintStyle = PrintStyle()
    ) {
        self.naturalArtificial = naturalArtificial
        self.baseSoundingTouchingPitch = baseSoundingTouchingPitch
        self.printObject = printObject
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension Harmonic {
    // TODO: Consider renaming
    public enum NaturalArtificial: String {
        /// The natural element indicates that this is a natural harmonic. These are usually notated
        /// at base pitch rather than sounding pitch.
        case natural
        /// The artificial element indicates that this is an artificial harmonic.
        case artificial
    }

    // TODO: Consider renaming
    public enum BaseSoundingTouchingPitch: String {
        /// The base pitch is the pitch at which the string is played before touching to create the
        /// harmonic.
        case base
        /// The sounding-pitch is the pitch which is heard when playing the harmonic.
        case sounding
        /// The touching-pitch is the pitch at which the string is touched lightly to produce the
        /// harmonic.
        case touching
    }
}

extension Harmonic: Codable {
    // MARK: - Codable

    public enum CodingKeys: String, CodingKey {
        case naturalArtificial
        case baseSoundingTouchingPitch

        case printObject
        case printStyle
        case placement

        case natural
        case artificial

        case base = "base-pitch"
        case sounding = "sounding-pitch"
        case touching = "touching-pitch"
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        self.printStyle = try PrintStyle(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if container.contains(.natural) {
            self.naturalArtificial = .natural
        } else if container.contains(.artificial) {
            self.naturalArtificial = .artificial
        } else {
            self.naturalArtificial = nil
        }

        if container.contains(.base) {
            self.baseSoundingTouchingPitch = .base
        } else if container.contains(.sounding) {
            self.baseSoundingTouchingPitch = .sounding
        } else if container.contains(.touching) {
            self.baseSoundingTouchingPitch = .touching
        }

        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        self.placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        try printStyle.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let baseSoundingTouchingPitch = self.baseSoundingTouchingPitch {
            switch baseSoundingTouchingPitch {
            case .base:
                try container.encode(Empty(), forKey: .base)
            case .sounding:
                try container.encode(Empty(), forKey: .sounding)
            case .touching:
                try container.encode(Empty(), forKey: .touching)
            }
        }
        if let naturalArtificial = self.naturalArtificial {
            switch naturalArtificial {
            case .natural:
                try container.encode(Empty(), forKey: .natural)
            case .artificial:
                try container.encode(Empty(), forKey: .artificial)
            }
        }
        try container.encodeIfPresent(YesNo(printObject), forKey: .printObject)
        try container.encodeIfPresent(placement, forKey: .placement)
    }
}

extension Harmonic.NaturalArtificial: Equatable {}
extension Harmonic.NaturalArtificial: Codable {}

extension Harmonic.BaseSoundingTouchingPitch: Equatable {}
extension Harmonic.BaseSoundingTouchingPitch: Codable {}

extension Harmonic: Equatable {}
