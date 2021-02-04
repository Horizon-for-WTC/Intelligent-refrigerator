//
//  TopBar.swift
//  Intelligent refrigerator
//
//  Created by RemiliaScarlet on 2021/2/4.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        HStack{
            Spacer()
            Button(action:{}) {
                Image(systemName: "mic.fill")
            }
            Button(action: {}) {
                Image(systemName: "wifi")
            }
            Button(action: {}) {
                Image(systemName: "gearshape.fill")
            }
        }.padding()
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}
