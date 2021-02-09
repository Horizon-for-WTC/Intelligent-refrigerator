//
//  HomepageView.swift
//  Intelligent refrigerator
//
//  Created by cjj on 2021/2/9.
//

import SwiftUI

struct HomepageView: View {
    var formater:DateFormatter{
            let dataformatter=DateFormatter()
            dataformatter.dateFormat="HH:mm"
            return dataformatter
    }       //时间格式
    var formater2:DateFormatter{
            let dataformatter=DateFormatter()
            dataformatter.dateFormat="MM月dd日 | EEEE"
            return dataformatter
        }   //日期格式
    @State var  stardmusic=0.0           //音乐默认起始时间
    @State var  endmusic=3.0             //音乐结束时间
    @State var  isplay=false            //音乐是否播放
    var body: some View {
        NavigationView {
            VStack
            {
                //头部区域
                HStack
                {
                    VStack(alignment: .leading)
                    {
                        HStack
                        {
                            Text(Date() as NSObject,formatter: formater)
                                .font(.system(size: 75))
                                .fontWeight(.semibold)
                                       //时间
                            Image(systemName: "drop.fill")
                                .resizable()
                                .frame(width: 30, height: 50) //天气
                                .padding(.horizontal, 60.0)
                        }
                        HStack
                        {
                            Text(Date(),formatter: formater2)
                                .font(.system(size: 23))
                                .padding(.horizontal)   //日期
                            Text("20℃")                 //温度
                                .font(.system(size: 20))
                                .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
                .padding([.top, .leading, .bottom])
                //底部区域
                HStack
                {   //左侧
                    VStack
                    {
                        //菜谱功能
                        VStack(alignment: .leading)
                                {
                                    HStack
                                    {
                                        Text("菜谱推荐")
                                            .foregroundColor(.white)
                                            .font(.custom("", fixedSize:24))
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    Image("perch")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: UIScreen.main.bounds.width/2-30, height: 200)
                                }
                                .frame(width: UIScreen.main.bounds.width/2, height: 300)
                                .background(Color.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        
                        //留言板功能
                        ZStack
                        {
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color.gray)
                                .frame(width: UIScreen.main.bounds.width/2, height: 200)
                            HStack
                            {
                                Button(action: {}, label: {
                                    VStack(spacing: 10.0)
                                    {
                                       Image(systemName: "plus.circle")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                       Text("写留言")
                                        .frame(width: 100, height: 40)
                                        .background(Color.white.opacity(0.2))
                                        .clipShape(Capsule())
                                    }.foregroundColor(.white)
                                })
                            
                                Button(action: {}, label: {
                                    
                                })
                            }
                        }
                        //冰箱控制功能
                        VStack
                        {
                            VStack(alignment: .leading)
                            {
                                Text("冰箱控制")
                                    .font(.system(size: 40))
                                    .padding(.trailing, 200)
                                Text("您的冰箱现在很健康哦～")       //冰箱状态
                            }
                            HStack
                            {
                                VStack
                                {
                                    Text("4")                  //冰箱冷藏温度
                                        .font(.system(size: 50))
                                        .padding(.horizontal)
                                    Text("冷藏℃")
                                }
                                .padding()
                                Text("|")
                                    .font(.system(size: 50))
                                VStack
                                {
                                    Text("-14")             //冰箱冷冻温度
                                        .font(.system(size: 50))
                                        .padding(.horizontal)
                                    Text("冷冻℃")
                                }
                            }
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width/2, height: 200)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        
                    }
                    //右侧
                    VStack
                    {
                        //音乐区
                        HStack
                        {
                            Image("perch")                  //歌曲缩略图
                            VStack(alignment: .leading, spacing: 6.0)
                            {
                                Text("周杰伦")              //歌手
                                Text("告白气球")            //歌曲
                                Slider(value: $stardmusic)
                                HStack
                                {
                                    Text("\(stardmusic,specifier: "%.2f")")
                                    Spacer()
                                    Text("\(endmusic,specifier: "%.2f")")
                                        .padding(.trailing)
                                        
                                }
                                HStack{
                                    Spacer()
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Image(systemName: "backward.end.fill")
                                    })
                                    Spacer()
                                    Button(action: {
                                        self.isplay.toggle()
                                    }, label: {
                                        Image(systemName: isplay ? "pause.fill" : "play.fill")
                                    })
                                    Spacer()
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Image(systemName: "forward.end.fill")
                                    })
                                    .padding(.trailing)
                                    Spacer()
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width/2-30, height: 200)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        //食物区
                        VStack(alignment: .leading)
                        {
                            HStack {
                                Text("食品管理")
                                    .font(.system(size: 40))
                                Spacer()
                            }
                            HStack
                            {
                                Image("perch")              //食物图片
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(width: 60, height: 60, alignment: .center)
                                VStack(alignment: .leading)
                                {
                                    Text("西红柿")                 //食物名称
                                    HStack
                                    {
                                        Image(systemName: "exclamationmark.triangle")
                                        Text("已过期")             //食物状态
                                    }
                                }
                                
                            }
                            HStack
                            {
                                Image("perch")              //食物图片
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(width: 60, height: 60, alignment: .center)
                                    .clipShape(Circle())
                                VStack(alignment: .leading)
                                {
                                    Text("生菜")                 //食物名称
                                    HStack
                                    {
                                        Image(systemName: "exclamationmark.triangle")
                                        Text("距离过期1天")             //食物状态
                                    }
                                }
                                
                            }
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width/2-30, height: 300)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .foregroundColor(.white)
                        //功能区
                        VStack {
                            HStack(spacing: 20.0)
                            {   //定时器
                                Button(action: {}, label: {
                                   VStack
                                    {
                                       Image("perch")
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                        .frame(width: 60, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                       Text("定时器")
                                    }
                                })
                                //门铃
                                Button(action: {}, label: {
                                   VStack
                                    {
                                       Image("perch")
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                        .frame(width: 60, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                       Text("门铃")
                                    }
                                })
                                //电话
                                Button(action: {}, label: {
                                   VStack
                                    {
                                       Image("perch")
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                        .frame(width: 60, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                       Text("电话")
                                    }
                                })
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width/2-30, height: 200)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .foregroundColor(.white)
                    }
                }
                Spacer()
              
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
