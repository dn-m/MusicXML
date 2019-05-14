//
//  BarStyle.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// Bar-style contains style information. Choices are regular, dotted, dashed, heavy, light-light,
/// light-heavy, heavy-light, heavy-heavy, tick (a short stroke through the top line), short (a
/// partial barline between the 2nd and 4th lines), and none.
public enum BarStyle: String {
    case regular
    case dotted
    case dashed
    case heavy
    case lightLight = "light-light"
    case lightHeavy = "light-heavy"
    case heavyLight = "heavy-light"
    case heavyHeavy = "heavy-heavy"
    case tick
    case short
    case none
}

extension BarStyle: Equatable { }
extension BarStyle: Decodable { }
