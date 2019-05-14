//
//  KindValue.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// A kind-value indicates the type of chord. Degree elements can then add, subtract, or alter from
/// these starting points. Values include:  Triads: major (major third, perfect fifth) minor (minor
/// third, perfect fifth) augmented (major third, augmented fifth) diminished (minor third,
/// diminished fifth) Sevenths: dominant (major triad, minor seventh) major-seventh (major triad,
/// major seventh) minor-seventh (minor triad, minor seventh) diminished-seventh (diminished triad,
/// diminished seventh) augmented-seventh (augmented triad, minor seventh) half-diminished
/// (diminished triad, minor seventh) major-minor (minor triad, major seventh) Sixths: major-sixth
/// (major triad, added sixth) minor-sixth (minor triad, added sixth) Ninths: dominant-ninth
/// (dominant-seventh, major ninth) major-ninth (major-seventh, major ninth) minor-ninth
/// (minor-seventh, major ninth) 11ths (usually as the basis for alteration): dominant-11th
/// (dominant-ninth, perfect 11th) major-11th (major-ninth, perfect 11th) minor-11th (minor-ninth,
/// perfect 11th) 13ths (usually as the basis for alteration): dominant-13th (dominant-11th, major
/// 13th) major-13th (major-11th, major 13th) minor-13th (minor-11th, major 13th) Suspended:
/// suspended-second (major second, perfect fifth) suspended-fourth (perfect fourth, perfect fifth)
/// Functional sixths: Neapolitan Italian French German Other: pedal (pedal-point bass) power
/// (perfect fifth) Tristan  The "other" kind is used when the harmony is entirely composed of add
/// elements. The "none" kind is used to explicitly encode absence of chords or functional harmony.
public enum KindValue: String {
    case major
    case minor
    case augmented
    case diminished
    case dominant
    case majorSeventh = "majorSeventh"
    case minorSeventh = "minorSeventh"
    case diminishedSeventh = "diminished-seventh"
    case augmentedSeventh = "augmented-seventh"
    case halfDiminished = "half-diminished"
    case minorMajor = "minor-major"
    case majorSixth = "major-sixth"
    case minorSixth = "minor-sixth"
    case dominantNinth = "dominant-ninght"
    case majorNinth = "major-ninth"
    case minorNinth = "minor-ninth"
    case dominantEleventh = "dominant-11th"
    case majorEleventh = "major-11th"
    case minorEleventh = "minor-11th"
    case dominantThirteenth = "dominant-13th"
    case majorThirteenth = "major-13th"
    case minorThirteenth = "minor-13th"
    case suspendedSecond = "suspended-second"
    case suspendedFourth = "suspended-fourth"
    case neapolitan = "Neopolitan"
    case italian = "Italian"
    case french = "French"
    case german = "German"
    case pedalPointBass = "pedal-point-bass"
    case power
    case tristan
    case other
    case none
}

extension KindValue: Equatable { }
extension KindValue: Decodable { }
