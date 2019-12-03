//
//  LevelDisplay.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The level-display attribute group specifies three common ways to indicate editorial indications:
/// putting parentheses or square brackets around a symbol, or making the symbol a different size.
/// If not specified, they are left to application defaults. It is used by the level and accidental
/// elements.
public struct LevelDisplay {
    // MARK: - Instance Properties

    public let parentheses: Bool
    public let bracket: Bool
    public let size: SymbolSize

    // MARK: - Initializers

    public init(parentheses: Bool, bracket: Bool, size: SymbolSize) {
        self.parentheses = parentheses
        self.bracket = bracket
        self.size = size
    }
}

extension LevelDisplay: Equatable {}
extension LevelDisplay: Codable {}
