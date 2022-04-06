//
//  HeartView.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import SwiftUI

struct HeartView: View {
    var heartScale: Double
    var heartColor: Color
    
    /// 定义一个心形类 继承 Shape 实现 path 方法
    struct HeartShape : Shape {
        
        func path(in rect: CGRect) -> Path {
            /// 新建一个path路径
            var path = Path()
            
            /// 先添加一个矩形上去 大小又 rect 参数决定
            path.addPath(Rectangle().path(in: rect))

            /// 在添加一个圆，添加到左边 大小还是  rect 参数决定 大，但是 y 是 也就是top 是高度的一半 的 负值，也是 top 往上移动
            let circleRectLeft = CGRect(x: 0, y: -(rect.height / 2), width: rect.width, height: rect.height)
            
            path.addPath(Circle().path(in: circleRectLeft))
            
            /// 在添加一个圆，添加到又边 大小还是  rect 参数决定 大，但是 x 是 也就是left 是宽度的一半
            let circleRectRight = CGRect(x: (rect.width / 2), y: 0, width: rect.width, height: rect.height)
            
            path.addPath(Circle().path(in: circleRectRight))
            
            return path
        }
    }

    /// View 调用
    var body: some View{
      HeartShape()
        .fill(heartColor)
        .frame(width: 100, height: 100)
        .rotationEffect(Angle(degrees: -45))
        .scaleEffect(heartScale)
        .opacity(0.6)
    }
}

struct HeartView_Previews: PreviewProvider {
    static var previews: some View {
        HeartView(heartScale: 1.0, heartColor: Color.red)
    }
}
