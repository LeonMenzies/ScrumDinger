//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Leon Menzies on 18/01/23.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(theme.mainColor)
            Label(theme.name, systemImage: "paintpalette")
                .padding(4)
        }
        .foregroundColor(theme.accentColor)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ThemeView_Preview: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .buttercup)
    }
}
