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
    public let printObject: Bool?
    public let printStyle: PrintStyle?
    public let placement: AboveBelow?
    public let naturalArtificial: NaturalArtificial?
    public let baseSoundingTouchingPitch: BaseSoundingTouchingPitch?
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
extension Harmonic.NaturalArtificial: Decodable { }

extension Harmonic.BaseSoundingTouchingPitch: Equatable { }
extension Harmonic.BaseSoundingTouchingPitch: Decodable { }

extension Harmonic: Equatable { }
extension Harmonic: Decodable { }
