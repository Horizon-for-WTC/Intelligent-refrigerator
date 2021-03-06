//
//  FoodLabel.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/5.
//

import SwiftUI

struct FoodLabel: View {
    let columns=[GridItem(.adaptive(minimum: UIScreen.main.bounds.width/5))]
    var body: some View {
        VStack(spacing: 20.0) {
            ZStack {
                HStack {
                    Image(systemName: "house")
                        .imageScale(.large)
                    Spacer()
                }
                .padding(.horizontal)
                Text("添加食材")
                    .font(.title2)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.black.opacity(0.1))
                    .frame(width: UIScreen.main.bounds.width-30, height: 40, alignment: .center)
                HStack{
                    Image(systemName: "magnifyingglass").foregroundColor(.white)
                    Text("请输入食材").foregroundColor(.gray)
                    Spacer()
                }
                .padding(.horizontal,30)
            }
            VStack {
                HStack {
                    Text("常用标签")
                        .foregroundColor(.white)
                        .padding(.horizontal,24)
                    Spacer()
                }
                HStack {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<5, id: \.self) { _ in
                            CJJLable()
                        }
                    }
                }
                .padding(.bottom, 10.0)
            }
            
            
            Spacer()
        }.background(Color.gray.ignoresSafeArea())
    }
}

struct CJJLable:View {
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.white)
                .frame(width: 150, height: 80, alignment: .center)
            HStack{
                Text("🍅西红柿").font(.title2)
            }
        }
    }
}
struct FoodLabel_Previews: PreviewProvider {
    static var previews: some View {
        FoodLabel()
    }
}
