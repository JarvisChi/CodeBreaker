//
//  CodeBreakerView.swift
//  CodeBreaker
//
//  Created by Dan Chi on 1/4/26.
//

import SwiftUI

struct CodeBreakerView: View {
    @State var game = CodeBreaker(pegChoices: [.brown, .yellow, .orange, .black], pegCount: 4)
    var body: some View {
        VStack {
            view(for: game.masterCode)
            ScrollView{
                view(for: game.guess)
                ForEach(game.attempts.indices.reversed(), id: \.self) { index in
                    view(for: game.attempts[index])
                }
            }
            resetButton
            //            pegs(colors: game.attempt[0].pegs)
        }
        .padding()
    }
    var guessButton: some View {
        Button("Guess"){
            withAnimation {
                game.attemptGuess()
            }
        }
        .font(.system(size: 80))
        .minimumScaleFactor(0.1)
    }

    var resetButton: some View {
        let pegCount = [3, 4, 5, 6].randomElement()
        return Button("Reset"){
            game = CodeBreaker(pegChoices: [.brown, .yellow, .orange, .black], pegCount: pegCount ?? 4)
        }
    }

    func view(for code: Code) -> some View {
        HStack{
            ForEach(code.pegs.indices, id: \.self){ index in
                RoundedRectangle(cornerRadius: 10)
                    .overlay {
                        if code.pegs[index]  == Code.missing {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.gray)
                        }
                    }
                    .contentShape(Rectangle())
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(code.pegs[index])
                    .onTapGesture {
                        if code.kind == .guess{
                            game.changeGuessPeg(at: index)
                        }
                    }
            }
            MatchMarkers(matches: code.matches)
                .overlay {
                    if code.kind == .guess{
                        guessButton
                    }
                }
        }
    }
}

#Preview {
    CodeBreakerView()
}
