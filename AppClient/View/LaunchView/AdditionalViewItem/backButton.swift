//
//  backButton.swift
//  WeTalk
//
//  Created by gaoyu shi on 17/11/20.
//

import SwiftUI

struct backButton: View {
    var body: some View {
        Image(systemName: "arrow.left.circle")
            .font(.system(size: 24))
            .foregroundColor(Color(.systemGreen))
    }
}

struct backButton_Previews: PreviewProvider {
    static var previews: some View {
        backButton()
    }
}
