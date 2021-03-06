//
//  AddFood.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/5.
//

import SwiftUI

struct AddFood: View {
    @State var num=0
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width-50, height: UIScreen.main.bounds.height/2.2, alignment: .center)
            VStack(spacing: 20.0) {
                Text("请确定添加的食材")
                Rectangle()
                    .fill(Color.black.opacity(0.6))
                    .frame(width: 80, height: 80, alignment: .center).clipShape(RoundedRectangle(cornerRadius: 10))
                Text("火龙果")
                Text("将于2020年10月26日过期")
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: UIScreen.main.bounds.width-100, height: 1, alignment: .center)
                ZStack {
                    Stepper(value: $num, in: 1...10) {
                        Text("期限(天)")
                    }
                    .padding(.horizontal, 50.0)
                    HStack {
                        Spacer()
                        Text("\(num)").padding(.horizontal, 90)
                    }
                }
                HStack(spacing: 30.0){
                    Text("一周").padding().font(.title).border(Color.black, width: 2)
                    Text("一个月").padding().font(.title).border(Color.black, width: 2)
                    Text("两个月").padding().font(.title).border(Color.black, width: 2)
                    Text("三个月").padding().font(.title).border(Color.black, width: 2)
                    Text("半年").padding().font(.title).border(Color.black, width: 2)
                }
                .padding(.horizontal)
                HStack{
                    
                    Text("取消")
                        .padding(.horizontal,120)
                    Text("确定")
                        .padding(.horizontal,120)
                }
                .font(.title)
                .padding()
            }
        }
    }
}

struct AddFood_Previews: PreviewProvider {
    static var previews: some View {
        AddFood()
    }
}
