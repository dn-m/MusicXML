//
//  BendSound.swift
//  MusicXML
//
//  Created by James Bean on 5/19/19.
//

// > The bend-sound entity is used for bend and slide elements,
// > and is similar to the trill-sound. Here the beats element
// > refers to the number of discrete elements (like MIDI pitch
// > bends) used to represent a continuous bend or slide. The
// > first-beat indicates the percentage of the direction for
// > starting a bend; the last-beat the percentage for ending it.
// > The default choices are:
//
// >     accelerate = "no"
// >     beats = "4" (minimum of "2")
// >     first-beat = "25"
// >     last-beat = "75"
public struct BendSound {
    public let accelerate: Bool = false
    public let beats: Int = 4
    public let firstBeat: Int = 25
    public let lastBeat: Int = 75
}

extension BendSound: Equatable { }
extension BendSound: Decodable { }
