//
//  BeatRepeat.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The beat-repeat type is used to indicate that a single beat (but possibly many notes) is
/// repeated. Both the start and stop of the beat being repeated should be specified. The
/// beat-repeat element specifies a notation style for repetitions. The actual music being repeated
/// needs to be repeated within the MusicXML file. This element specifies the notation that
/// indicates the repeat.
public struct BeatRepeat {
    // MARK: - Instance Properties

    public let type: StartStop
    public let slashes: Int
    public let useDots: Bool

    // MARK - Initializers

    public init(type: StartStop, slashes: Int, useDots: Bool) {
        self.type = type
        self.slashes = slashes
        self.useDots = useDots
    }
}

extension BeatRepeat: Equatable {}
extension BeatRepeat: Codable {}
