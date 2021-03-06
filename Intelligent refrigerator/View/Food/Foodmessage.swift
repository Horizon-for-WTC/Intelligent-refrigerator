//
//  Foodmessage.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/5.
//

import SwiftUI

struct Foodmessage: View {
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.white)
                    .frame(width: UIScreen.main.bounds.width-50, height: UIScreen.main.bounds.height/2.5, alignment: .center)
                VStack(spacing: 15.0){
                    HStack {
                        Image(systemName: "chevron.left").offset(CGSize(width: 0.0, height: 30.0))
                        Image("perch")
                            .resizable()
                            .frame(width: 200, height: 200, alignment: .center)
                            
                        Image(systemName: "chevron.right")
                            .offset(CGSize(width: 0.0, height: 30.0))
                    }.offset(CGSize(width: 0, height: -50))
                        Text("西红柿")
                            .font(.largeTitle)
                            .padding()
                    VStack(alignment: .leading, spacing: 18.0) {
                        Text("已过期5天,请尽快处理哦！")
                        Text("存放日期  2020/09/28")
                        Text("过期日期  2020/09/28")
                        Text("推荐舱室  冷藏室")
                    }.font(.title2)
                    .padding(.bottom, 100.0)
                   
                }
            }
        }
    }
}

struct Foodmessage_Previews: PreviewProvider {
    static var previews: some View {
        Foodmessage()
    }
}
