//
//  Play.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

/// The play type, new in Version 3.0, specifies playback techniques to be used in conjunction with
/// the instrument-sound element. When used as part of a sound element, it applies to all notes
/// going forward in score order. When used as part of a note element, it applies to the current
/// note only.
public struct Play {

    public enum Value {
        case ipa(String)
        case mute(Mute)
        case semiPitched(SemiPitched)
        case otherPlay(OtherPlay)
    }

    public let values: [Value]
}

extension Play.Value: Equatable { }
extension Play.Value: Codable {
    #warning("TODO: Implement Play.Value: Codable conformance")
    public init(from decoder: Decoder) throws {
        fatalError("Play.Value.init(from: Decoder) not yet implemented!")
    }
}

extension Play: Equatable { }
extension Play: Codable { }
