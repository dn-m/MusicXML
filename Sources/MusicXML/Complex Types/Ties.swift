//
//  Ties.swift
//  MusicXML
//
//  Created by Ben Lu on 10/1/19.
//

public struct Ties {
    public let start: Tie?
    public let stop: Tie?

    public init(start: Tie? = nil, stop: Tie? = nil) {
        self.start = start
        self.stop = stop
    }

    public init(start: Bool, stop: Bool) {
        self.start = start ? Tie(.start) : nil
        self.stop = stop ? Tie(.stop) : nil
    }

    init(ties: [Tie]) {
        var startTie: Tie?
        var stopTie: Tie?
        for tie in ties {
            if tie.type == .start {
                startTie = tie
            } else if tie.type == .stop {
                stopTie = tie
            }
        }
        self.start = startTie
        self.stop = stopTie
    }
}

extension Ties: Equatable {}
