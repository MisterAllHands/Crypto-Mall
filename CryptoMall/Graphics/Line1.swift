//
//  Line1.swift
//  Background1
//
//  Created by Aksonvady Phomhome on 2021-04-02.
//

import SwiftUI

struct Line1: View {
    var body: some View {
        Shape6()
            .stroke(Color(#colorLiteral(red: 0.9682565331459045, green: 0.7807638049125671, blue: 0.9859028458595276, alpha: 1)), lineWidth: 0.7191506624221802)
            .frame(width: 160, height: 190)
            .offset(x: 130, y: 30)
            .opacity(0.5)
            .blendMode(.overlay)
    }
}

struct Line1_Previews: PreviewProvider {
    static var previews: some View {
        Line1()
    }
}
