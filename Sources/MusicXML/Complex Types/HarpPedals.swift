//
//  HarpPedals.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The harp-pedals type is used to create harp pedal diagrams. The pedal-step and pedal-alter
/// elements use the same values as the step and alter elements. For easiest reading, the
/// pedal-tuning elements should follow standard harp pedal order, with pedal-step values of D, C,
/// B, E, F, G, and A.
public struct HarpPedals {
    public let printStyleAlign: PrintStyleAlign
    public let pedalTuning: [PedalTuning]
}

extension HarpPedals: Equatable { }
extension HarpPedals: Codable { }
