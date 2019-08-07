//
//  Partwise_02_Rests_D_Multimeasure_TimeSignatures.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/7/19.
//

extension Partwise_02_Rests {
    var D_Multimeasure_TimeSignatures: String {
        """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE score-partwise PUBLIC "-//Recordare//DTD MusicXML 1.1 Partwise//EN"
                                        "http://www.musicxml.org/dtds/partwise.dtd">
        <score-partwise version="1.1">
          <identification>
            <miscellaneous>
              <miscellaneous-field name="description">Multi-Measure rests should always
                  be converted into durations that are a multiple of the time
                  signature.</miscellaneous-field>
            </miscellaneous>
          </identification>
          <part-list>
            <score-part id="P1">
              <part-name print-object="no">MusicXML Part</part-name>
            </score-part>
          </part-list>
          <!--=========================================================-->
          <part id="P1">
            <measure number="1">
              <attributes>
                <divisions>1</divisions>
                <key>
                  <fifths>0</fifths>
                  <mode>major</mode>
                </key>
                <time symbol="common">
                  <beats>4</beats>
                  <beat-type>4</beat-type>
                </time>
                <clef>
                  <sign>G</sign>
                  <line>2</line>
                </clef>
                <measure-style>
                  <multiple-rest>2</multiple-rest>
                </measure-style>
              </attributes>
              <note>
                <rest/>
                <duration>4</duration>
                <voice>1</voice>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="2">
              <note>
                <rest/>
                <duration>4</duration>
                <voice>1</voice>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="3">
              <attributes>
                <time>
                  <beats>3</beats>
                  <beat-type>4</beat-type>
                </time>
                <measure-style>
                  <multiple-rest>3</multiple-rest>
                </measure-style>
              </attributes>
              <note>
                <rest/>
                <duration>3</duration>
                <voice>1</voice>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="4">
              <note>
                <rest/>
                <duration>3</duration>
                <voice>1</voice>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="5">
              <note>
                <rest/>
                <duration>3</duration>
                <voice>1</voice>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="6">
              <attributes>
                <time>
                  <beats>2</beats>
                  <beat-type>4</beat-type>
                </time>
                <measure-style>
                  <multiple-rest>2</multiple-rest>
                </measure-style>
              </attributes>
              <note>
                <rest/>
                <duration>2</duration>
                <voice>1</voice>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="7">
              <note>
                <rest/>
                <duration>2</duration>
                <voice>1</voice>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="8">
              <attributes>
                <time symbol="common">
                  <beats>4</beats>
                  <beat-type>4</beat-type>
                </time>
                <measure-style>
                  <multiple-rest>2</multiple-rest>
                </measure-style>
              </attributes>
              <note>
                <rest/>
                <duration>4</duration>
                <voice>1</voice>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="9">
              <note>
                <rest/>
                <duration>4</duration>
                <voice>1</voice>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="10">
              <note>
                <pitch>
                  <step>C</step>
                  <octave>5</octave>
                </pitch>
                <duration>4</duration>
                <voice>1</voice>
                <type>whole</type>
              </note>
              <barline location="right">
                <bar-style>light-heavy</bar-style>
              </barline>
            </measure>
          </part>
          <!--=========================================================-->
        </score-partwise>
        """
    }
}
