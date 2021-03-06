//
//  Answer.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//

import SwiftUI

struct Answer: View {
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Image(systemName: "house")
                        .imageScale(.large)
                    Spacer()
                }
                .padding()
                Text("来电")
                    .font(.title2)
            }
            Spacer()
            VStack(spacing: 8.0) {
                Image("cc")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                Text("176 8377 0064")
                    .foregroundColor(.black)
                    .font(.title2)
                Text("湖北武汉")
            }
            Spacer()
            HStack{
                Spacer()
                CircleButton(image: "phone.down.circle.fill", title: "接听", size: 80)
                Spacer()
                CircleButton(image: "phone.circle.fill", title: "挂断", size: 80)
                Spacer()
            }
            Spacer()
        }
    }
}

struct Answer_Previews: PreviewProvider {
    static var previews: some View {
        Answer()
    }
}
