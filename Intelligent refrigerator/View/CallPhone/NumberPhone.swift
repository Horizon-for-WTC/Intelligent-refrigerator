//
//  NumberPhone.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//

import SwiftUI

struct NumberPhone: View {
    @State var textphone=""
    var body: some View {
        VStack {
           TextField("", text: $textphone)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.namePhonePad)
        }
    }
}

struct NumberPhone_Previews: PreviewProvider {
    static var previews: some View {
        NumberPhone()
    }
}
