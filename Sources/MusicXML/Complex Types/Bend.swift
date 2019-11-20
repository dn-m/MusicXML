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
    public let printStyle: PrintStyle
    public let accelerate: Bool?
    /// The beats attribute specifies the beats used in a trill-sound or bend-sound. It is a decimal
    /// value with a minimum value of 2.
    public let beats: Bool?
    public let firstBeat: Double?
    public let lastBeat: Double?
    public let bendAlter: Double?
    public let prependOrRelease: PreBendOrRelease?
    public let withBar: PlacementText?

    public init(printStyle: PrintStyle = PrintStyle(), accelerate: Bool? = nil, beats: Bool? = nil, firstBeat: Double? = nil, lastBeat: Double? = nil, bendAlter: Double? = nil, prependOrRelease: PreBendOrRelease? = nil, withBar: PlacementText? = nil) {
        self.printStyle = printStyle
        self.accelerate = accelerate
        self.beats = beats
        self.firstBeat = firstBeat
        self.lastBeat = lastBeat
        self.bendAlter = bendAlter
        self.prependOrRelease = prependOrRelease
        self.withBar = withBar
    }
}

extension Bend {
    public enum PreBendOrRelease: String {
        case preBend
        case release
    }
}

extension Bend.PreBendOrRelease: Equatable {}
extension Bend.PreBendOrRelease: Codable {}

extension Bend: Equatable {}
extension Bend: Codable {
    enum CodingKeys: String, CodingKey {
        case accelerate
        case beats
        case firstBeat
        case lastBeat
        case bendAlter
        case prependOrRelease
        case withBar
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        printStyle = try PrintStyle(from: decoder)
        accelerate = try container.decodeIfPresent(Bool.self, forKey: .accelerate)
        beats = try container.decodeIfPresent(Bool.self, forKey: .beats)
        firstBeat = try container.decodeIfPresent(Double.self, forKey: .firstBeat)
        lastBeat = try container.decodeIfPresent(Double.self, forKey: .lastBeat)
        bendAlter = try container.decodeIfPresent(Double.self, forKey: .bendAlter)
        prependOrRelease = try container.decodeIfPresent(PreBendOrRelease.self, forKey: .prependOrRelease)
        withBar = try container.decodeIfPresent(PlacementText.self, forKey: .withBar)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try printStyle.encode(to: encoder)
        try container.encodeIfPresent(accelerate, forKey: .accelerate)
        try container.encodeIfPresent(beats, forKey: .beats)
        try container.encodeIfPresent(firstBeat, forKey: .firstBeat)
        try container.encodeIfPresent(lastBeat, forKey: .lastBeat)
        try container.encodeIfPresent(bendAlter, forKey: .bendAlter)
        try container.encodeIfPresent(prependOrRelease, forKey: .prependOrRelease)
        try container.encodeIfPresent(withBar, forKey: .withBar)
    }
}
