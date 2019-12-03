//
//  Repeat.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The repeat type represents repeat marks. The start of the repeat has a forward direction while
/// the end of the repeat has a backward direction. Backward repeats that are not part of an ending
/// can use the times attribute to indicate the number of times the repeated section is played.
public struct Repeat {
    // MARK: - Instance Properties

    public let direction: BackwardForward
    public let times: Int?
    public let winged: Winged?

    // MARK - Initializers

    public init(
        direction: BackwardForward,
        times: Int? = nil,
        winged: Winged? = nil
    ) {
        self.direction = direction
        self.times = times
        self.winged = winged
    }
}

extension Repeat: Equatable {}
extension Repeat: Codable {}
