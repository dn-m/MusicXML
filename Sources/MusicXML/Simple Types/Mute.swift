//
//  Mute.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The mute type represents muting for different instruments, including brass, winds, and strings.
/// The on and off values are used for undifferentiated mutes. The remaining values represent
/// specific mutes.
public enum Mute: String {
    case on
    case off
    case straight
    case cup
    case harmonNoStem
    case harmonStem
    case bucket
    case plunger
    case hat
    case solotone
    case practice
    case stopMute
    case stopHand
    case echo
    case palm
}

extension Mute: Equatable {}
extension Mute: Codable {}
