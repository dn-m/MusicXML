//
//  Bend.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The bend type is used in guitar and tablature. The bend-alter element indicates the number of
/// steps in the bend, similar to the alter element. As with the alter element, numbers like 0.5 can
/// be used to indicate microtones. Negative numbers indicate pre-bends or releases; the pre-bend
/// and release elements are used to distinguish what is intended. A with-bar element indicates that
/// the bend is to be done at the bridge with a whammy or vibrato bar. The content of the element
/// indicates how this should be notated.
public struct Bend {
    public let printStyle: PrintStyle?
    public let accelerate: Bool?
    /// The beats attribute specifies the beats used in a trill-sound or bend-sound. It is a decimal
    /// value with a minimum value of 2.
    public let beats: Bool?
    public let firstBeat: Double?
    public let lastBeat: Double?
    public let bendAlter: Double?
    public let prependOrRelease: PreBendOrRelease?
    public let withBar: PlacementText?
}

extension Bend {
    public enum PreBendOrRelease: String {
        case preBend
        case release
    }
}

extension Bend.PreBendOrRelease: Equatable { }
extension Bend.PreBendOrRelease: Codable { }

extension Bend: Equatable { }
extension Bend: Codable { }
