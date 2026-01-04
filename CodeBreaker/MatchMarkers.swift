//
//  MatchMarkers.swift
//  CodeBreaker
//
//  Created by Dan Chi on 1/4/26.
//

import SwiftUI

struct MatchMarkers: View {
    let matches: [Match]
    var body: some View {
        HStack{
            VStack{
                matchMarker(peg: 0)
                matchMarker(peg: 1)
            }
            VStack{
                matchMarker(peg: 2)
                matchMarker(peg: 3)
            }
            VStack{
                matchMarker(peg: 4)
                matchMarker(peg: 5)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }

    func matchMarker(peg: Int) -> some View {
        let exactCount = matches.count { $0 == .exact }
        let foundCount = matches.count { $0 != .nomatch }
        return Circle()
            .fill(peg < exactCount ? Color.primary : Color.clear)
            .strokeBorder(peg < foundCount ? Color.primary : Color.clear, lineWidth: 2)
            .aspectRatio(1, contentMode: .fit)
    }
}

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMarkers_Previews: View{
    let count: Int
    let matches: [Match]
    var body: some View{
        HStack{
            pegs(count: count)
            MatchMarkers(matches: matches)
        }
        .padding()
    }
    func pegs(count: Int) -> some View {
        ForEach(0..<count, id: \.self) { _ in
            Circle()
                .frame(width: 40, height: 40)
        }
    }
}

#Preview {
    VStack(alignment: .leading){
        MatchMarkers_Previews(count: 3, matches: [.nomatch,.exact,.inexact,.inexact])
        MatchMarkers_Previews(count: 3, matches: [.exact])
        MatchMarkers_Previews(count: 4, matches: [.exact, .exact, .inexact, .inexact])
        MatchMarkers_Previews(count: 4, matches: [.nomatch,.exact,.inexact])
        MatchMarkers_Previews(count: 6, matches: [.nomatch,.exact,.exact, .exact,.inexact])
        MatchMarkers_Previews(count: 6, matches: [.nomatch,.exact,.exact, .exact,.inexact,.inexact,.inexact])
        MatchMarkers_Previews(count: 5, matches: [.nomatch,.exact,.exact,.inexact,.inexact,.inexact])
        MatchMarkers_Previews(count: 5, matches: [.nomatch,.exact,.inexact,.inexact])
    }
}
