//
//  ReveParsingExpectation.swift
//  
//
//  Created by Ben Lu on 10/13/19.
//

import MusicXML

class ReveParsingExpectation: ScoreTestExpectation {
    static let expected: MusicXML = MusicXML(Score(traversal: .partwise(Partwise(header: Header(partList: PartList(parts: [])), parts: []))))
}
