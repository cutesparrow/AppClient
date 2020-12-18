//
//  CustomModifier.swift
//  WeTalk
//
//  Created by gaoyu shi on 15/11/20.
//

import SwiftUI


struct MyTextFieldStyle:TextFieldStyle {
    private var color: Color
    
    init(color:Color) {
        self.color = color
    }
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 25,style: .continuous)
                    .stroke(self.color, lineWidth: 2.5)
            )
    }
}
