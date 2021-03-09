//
//  FoodLable.swift
//  Intelligent refrigerator
//
//  Created by 陈佳俊 on 2021/3/9.
//

import SwiftUI

struct FoodLabel: View {
    let columns=[GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 5))]
    @Environment(\.presentationMode) var presentationMode
    @State var isshow=false
    var body: some View {
        ZStack {
            VStack(spacing: 20.0) {
                ZStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "house")
                                .imageScale(.large)
                        })
                        Spacer()
                    }
                    .padding(.horizontal)
                    Text("添加食材")
                        .font(.title2)
                }.foregroundColor(.gray)
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.Neumorphic.main)
                        .softInnerShadow(RoundedRectangle(cornerRadius: 25.0), darkShadow: Color.black.opacity(0.8), lightShadow: Color.black.opacity(0.2), spread: 0.05, radius: 2)
                        .frame(width: UIScreen.main.bounds.width - 30, height: 40, alignment: .center)
                    HStack {
                        Image(systemName: "magnifyingglass").foregroundColor(.gray)
                        Text("请输入食材").foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                }
                VStack {
                    HStack {
                        Text("常用标签")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 24)
                        Spacer()
                    }
                    LazyVGrid(columns: columns) {
                        ForEach(0 ..< 5, id: \.self) { _ in
                            CJJLable(isshow: $isshow).padding()
                        }
                    }
                }
                Spacer()
            }
            .background(Color.Neumorphic.main.ignoresSafeArea())
            .blur(radius: isshow ? 5 : 0)
            .onTapGesture {
                self.isshow=false
            }
            if isshow {
                Foodmessage()
            }
        }
    }
}

struct CJJLable: View {
    @Binding var isshow: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.Neumorphic.main)
                .softOuterShadow()
                .frame(width: 150, height: 80, alignment: .center)
            Button(action: { self.isshow.toggle() }, label: {
                Text("🍅西红柿").font(.title2)
                    .foregroundColor(Color.black)
            })
        }
    }
}

struct FoodLabel_Previews: PreviewProvider {
    static var previews: some View {
        FoodLabel()
    }
}
