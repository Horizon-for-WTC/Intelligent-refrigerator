//
//  Foodmessage.swift
//  Intelligent refrigerator
//
//  Created by 陈佳俊 on 2021/3/9.
//

import SwiftUI

struct Foodmessage: View {
    @Environment(\.presentationMode) var presentationMode
//    @Binding var isshow:Bool
    var body: some View {
        ZStack {
            Color.Neumorphic.main.ignoresSafeArea().onTapGesture {
                self.presentationMode.wrappedValue.dismiss()
//                self.isshow.toggle()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.Neumorphic.main)
                    .softOuterShadow()
                    .frame(width: UIScreen.main.bounds.width-50, height: UIScreen.main.bounds.height/1.6, alignment: .center)
                VStack(spacing: 15.0) {
                    HStack {
                        Button(action:  {}, label: {
                            Image(systemName: "chevron.left").font(.title)
                        }).softButtonStyle(Circle())
                        
                        Image("perch")
                            .resizable()
                            .frame(width: 200, height: 200, alignment: .center)
                        Button(action:  {}, label: {
                            Image(systemName: "chevron.right").font(.title)
                        }).softButtonStyle(Circle())
                    }.offset(x: 0, y: -70)
                    Text("西红柿")
                        .font(.largeTitle)
                        .padding()
                    VStack(alignment: .leading, spacing: 18.0) {
                        Text("已过期5天,请尽快处理哦！")
                        Text("存放日期  2020/09/28")
                        Text("过期日期  2020/09/28")
                        Text("推荐舱室  冷藏室")
                    }.font(.title2)
                    Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20.0) {
                            ForEach(0 ..< 5, id: \.self) { _ in
                                BanderCook1()
                            }.padding()
                        }
                    }.frame(width: UIScreen.main.bounds.width/1.8).padding(.bottom, 30.0)
                    Spacer()
                }
            }.frame(width: UIScreen.main.bounds.width-50, height: UIScreen.main.bounds.height/1.5, alignment: .center)
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}

struct BanderCook1: View {
//    @Binding var isshowVideo:Bool
    var image="perch"
    var icon=""
    var title="今日菜谱"
    var sizebig: CGFloat=150
    var sizesmall: CGFloat=150
    var body: some View {
        VStack {
//            HStack {
//                Text("\(title)")
//                    .font(.title)
//                Spacer()
//                Image(systemName: "\(icon)")
//            }
//            .padding(.horizontal)
//            ScrollView(.horizontal, showsIndicators: false) {
            ZStack {
                Rectangle()
                    .fill(Color.Neumorphic.main)
                    .frame(width: sizebig, height: sizebig, alignment: .center)
                    .softOuterShadow()
                Image("\(image)")
                    .resizable()
                    .frame(width: sizesmall, height: sizesmall, alignment: .center)
                    .aspectRatio(contentMode: .fill)
            }
//            }
        }
    }
}

struct Foodmessage_Previews: PreviewProvider {
    static var previews: some View {
        Foodmessage().preferredColorScheme(.light)
    }
}
