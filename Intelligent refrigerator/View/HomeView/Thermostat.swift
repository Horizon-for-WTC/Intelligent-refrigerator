//
//  Thermostat.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/3/4.
//

import SwiftUI

struct Thermostat: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    VStack{
                        ZStack{
                            Rectangle()
                                .stroke(Color.white, lineWidth: 1.0)
                                .frame(width: UIScreen.main.bounds.width-300, height: UIScreen.main.bounds.height-400, alignment: .center)
                           
                            VStack(alignment: .leading, spacing: 8.0){
                                
                                VStack(alignment: .leading) {
                                    Text("冷藏室")
                                    Text("4℃")
                                        .font(.system(size: 40))
                                }
                                .offset(CGSize(width: 0, height: -250))
                                
                                Rectangle()
                                 .stroke(Color.white, lineWidth: 1.0)
                                 .frame(width: UIScreen.main.bounds.width-400, height: 1, alignment: .center)
                                
                                VStack(alignment: .leading) {
                                    Text("冷冻室")
                                    Text("-18℃")
                                        .font(.system(size: 40))
                                }
                                .offset(CGSize(width: 0, height:50))
                                
                            }
                            .foregroundColor(.white)
                           
                        }
                        }
                        .frame( maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray)
                        .navigationBarTitle(Text("冰箱控制"), displayMode: .inline)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: Button(action: {}, label: {
                            Image(systemName: "")
                    }),trailing: Button(action: {}, label: {
                        Image(systemName: "")
                }))
                }
                ScrollView(.horizontal, showsIndicators:false) {
                    HStack{
                        ForEach(0..<5, id: \.self) { value in
                            VStack {
                                Circle()
                                Text("模式")
                            }
                        }
                        .padding()
                    }.frame(width: UIScreen.main.bounds.width, height: 150, alignment: .center)
                    
                }.background(Color.gray)
            }.ignoresSafeArea()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Thermostat_Previews: PreviewProvider {
    static var previews: some View {
        Thermostat()
    }
}
