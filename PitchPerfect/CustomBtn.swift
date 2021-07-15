//
//  CustomBtn.swift
//  PitchPerfect
//
//  Created by Natalman Nahm on 7/15/21.
//

import SwiftUI

struct CustomBtn: View {
    var icon: String
    var wid: CGFloat = 92
    var hei: CGFloat = 92
    var body: some View {
        Image(icon)
            .padding()
            .frame(width: wid, height: hei)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color.black)
            .foregroundColor(.black)
            .shadow(color: .green, radius: 5)
    }
}

struct CustomBtn_Previews: PreviewProvider {
    static var previews: some View {
        CustomBtn(icon: "slow")
    }
}
