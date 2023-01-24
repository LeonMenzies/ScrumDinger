//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Leon Menzies on 22/01/23.
//

import SwiftUI

struct MettingHeaderView: View {
    let secondsElapsed: Int
    let secondsRamaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRamaining
    }
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    private var minutesRemaining: Int {
        secondsRamaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack (alignment: .trailing){
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRamaining)", systemImage: "hourglass.tophalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time Remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

struct MettingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MettingHeaderView(secondsElapsed: 60, secondsRamaining: 180, theme: .bubblegum)
            .previewLayout(.sizeThatFits)
    }
}
