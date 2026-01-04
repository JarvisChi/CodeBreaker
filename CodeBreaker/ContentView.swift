//
//  ContentView.swift
//  CodeBreaker
//
//  Created by Dan Chi on 1/4/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            pegs(colors: [.red, .green, .blue, .yellow])
        }
        .padding()
    }

    func pegs(colors: [Color]) -> some View {
        HStack{
            ForEach(colors.indices, id: \.self){ index in
                Circle().foregroundStyle(colors[index])
            }
            MatchMarkers(matches: [.nomatch,.exact,.inexact])
        }
    }

}

#Preview {
    ContentView()
}
