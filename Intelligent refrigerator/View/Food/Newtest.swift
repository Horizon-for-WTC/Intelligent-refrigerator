//
//  Newtest.swift
//  Intelligent refrigerator
//
//  Created by 陈佳俊 on 2021/3/12.
//

import SwiftUI

struct Newtest: View {
    var body: some View {
        ZStack {
            Color.purple.ignoresSafeArea()
            Circle().fill(Color.purple).softOuterShadow(darkShadow: Color.gray, lightShadow: Color.white, offset: 8, radius: 8).frame(width: 100, height: 100, alignment: .center)
        }
    }
}

struct Newtest_Previews: PreviewProvider {
    static var previews: some View {
        Newtest()
    }
}
