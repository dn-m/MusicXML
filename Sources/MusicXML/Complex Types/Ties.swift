//
//  File.swift
//  
//
//  Created by Ben Lu on 10/1/19.
//

public struct Ties {
    public var start: Tie?
    public var stop: Tie?

    public init(start: Tie?, stop: Tie?) {
        self.start = start
        self.stop = stop
    }

    init(ties: [Tie]) {
        for tie in ties {
            if tie.type == .start {
                self.start = tie
            } else if tie.type == .stop {
                self.stop = tie
            }
        }
    }
}

extension Ties: Equatable { }
