//
//  Foodmessage.swift
//  Intelligent refrigerator
//
//  Created by 陈佳俊 on 2021/3/9.
//

import SwiftUI

struct Foodmessage: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isshow:Bool
    var body: some View {
        ZStack {
            Color.Neumorphic.main.ignoresSafeArea().onTapGesture {
                self.presentationMode.wrappedValue.dismiss()
                self.isshow.toggle()
                
            }
            ZStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.Neumorphic.main)
                    .softOuterShadow()
                    .frame(width: UIScreen.main.bounds.width-50, height: UIScreen.main.bounds.height/2.5, alignment: .center)
                VStack(spacing: 15.0){
                    HStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "chevron.left").font(.title)
                        }).softButtonStyle(Circle())
                       
                        Image("perch")
                            .resizable()
                            .frame(width: 200, height: 200, alignment: .center)
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "chevron.right").font(.title)
                        }).softButtonStyle(Circle())
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
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}

struct Foodmessage_Previews: PreviewProvider {
    static var previews: some View {
        Foodmessage(isshow: FoodLabel().$isshow).preferredColorScheme(.dark)
    }
}
