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

    // MARK: - Elements

    public var naturalArtificial: NaturalArtificial?
    public var baseSoundingTouchingPitch: BaseSoundingTouchingPitch?

    // MARK: - Attributes

    public var printObject: Bool?
    public var printStyle: PrintStyle?
    public var placement: AboveBelow?

    public init(naturalArtificial: NaturalArtificial? = nil, baseSoundingTouchingPitch: BaseSoundingTouchingPitch? = nil, printObject: Bool? = nil, printStyle: PrintStyle? = nil, placement: AboveBelow? = nil) {
        self.naturalArtificial = naturalArtificial
        self.baseSoundingTouchingPitch = baseSoundingTouchingPitch
        self.printObject = printObject
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension Harmonic {
    /// TODO: Consider renaming
    public enum NaturalArtificial: String {
        /// The natural element indicates that this is a natural harmonic. These are usually notated
        /// at base pitch rather than sounding pitch.
        case natural
        /// The artificial element indicates that this is an artificial harmonic.
        case artificial
    }

    /// TODO: Consider renaming
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

extension Harmonic.NaturalArtificial: Equatable { }
extension Harmonic.NaturalArtificial: Codable { }

extension Harmonic.BaseSoundingTouchingPitch: Equatable { }
extension Harmonic.BaseSoundingTouchingPitch: Codable { }

extension Harmonic: Equatable { }
extension Harmonic: Codable { }
