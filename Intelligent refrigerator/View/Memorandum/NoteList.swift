//
//  NoteList.swift
//  Intelligent refrigerator
//
//  Created by 陈佳俊 on 2021/3/23.
//

import Neumorphic
import SwiftUI
import WaterfallGrid
struct NoteList: View {
    // 声明数据
    @FetchRequest(entity: Notes.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Notes.top, ascending: true), NSSortDescriptor(keyPath: \Notes.collect, ascending: false), NSSortDescriptor(keyPath: \Notes.date, ascending: true)])
    var note: FetchedResults<Notes>
    // 声明存储器
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State var isshow=false
    @State var isdel=false
    var body: some View {
        ZStack {
            Color.Neumorphic.main.ignoresSafeArea()
            VStack {
                // 头部
                ZStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "house")
                                .imageScale(.large)
                        })
                        Spacer()
                        Button(action: {
                            self.isshow=true
                        }, label: {
                            Image(systemName: "plus")
                        })
                            .sheet(isPresented: $isshow, content: {
                                NoteAdd()
                            })
                        // 编辑按钮
                        Button(action: {self.isdel.toggle()}, label: {
                            Image(systemName: "slider.horizontal.3")
                        })
                    }.padding(.horizontal).imageScale(.large)
                    Text("留言板")
                        .font(.title)
                }
                .foregroundColor(.gray)

                // 内容
                WaterfallGrid(note) { value in
                    NavigationLink(
                        destination: NoteAdd(name: value.name, index: Int(value.index), content: value.content, date: value.date, isedit: true),
                        label: {
                                NoteDetail(cjjvalue: value).softOuterShadow()

                        })
                }.padding()
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

struct NoteList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoteList()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
