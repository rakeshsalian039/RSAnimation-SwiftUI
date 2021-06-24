//
//  NotificationButton.swift
//  RSAnimaion
//
//  Created by Rakesh salian on 6/20/21.
//

import SwiftUI

struct NotificationButton: View {
    
    // MARK:- variables
    @State var strokeEnd: CGFloat = 0
    
    let buttonAction: () -> ()
    
    // MARK:- views
    var body: some View {
        ZStack {
            Button(action: {
                buttonAction()
            })
            {
                NotificationBell()
                    .trim(from: 0, to: strokeEnd)
                    .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, miterLimit: 4))
                    .foregroundColor(.blue)
                    .scaleEffect(self.strokeEnd == 1 ? 3 : 1)
            }
            .onAppear() {
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                    withAnimation(Animation.easeOut(duration: 0.5)) {
                        self.strokeEnd = 1
                    }
                }
            }
        }.frame(width: 56, height: 56, alignment: .leading)
    }
    
    // MARK:- functions
    
}

struct NotificationBell: Shape {
    
    // MARK:- functions
    func path(in rect: CGRect) -> Path {
        let cX: CGFloat = rect.midX
        let cY: CGFloat = rect.midY
        
        var path = Path()
        
        path.move(to: CGPoint(x: cX + 6, y: cY + -1))
        //path.addLine(to: CGPoint(x: cX + 6, y: cY + -1))
        path.addCurve(to: CGPoint(x: cX, y: cY + -7), control1: CGPoint(x: cX + 6, y: cY + -4.31), control2: CGPoint(x: cX + 3.31, y: cY + -7))
        path.addCurve(to: CGPoint(x: cX + -6, y: cY + -1), control1: CGPoint(x: cX + -3.31, y: cY + -7), control2: CGPoint(x: cX + -6, y: cY + -4.31))
        path.addCurve(to: CGPoint(x: cX + -9, y: cY + 8), control1: CGPoint(x: cX + -6, y: cY + 6), control2: CGPoint(x: cX + -9, y: cY + 8))
        path.addLine(to: CGPoint(x: cX + 9, y: cY + 8))
        path.addCurve(to: CGPoint(x: cX + 6, y: cY + -1), control1: CGPoint(x: cX + 9, y: cY + 8), control2: CGPoint(x: cX + 6, y: cY + 6))
        path.closeSubpath()
//
//
        path.move(to: CGPoint(x: cX + 1.73, y: cY + 12))
       // path.addLine(to: CGPoint(x: cX + 1.73, y: cY + 12))
        path.addCurve(to: CGPoint(x: cX + -1, y: cY + 12.73), control1: CGPoint(x: cX + 1.18, y: cY + 12.95), control2: CGPoint(x: cX + -0.04, y: cY + 13.28))
        path.addCurve(to: CGPoint(x: cX + -1.73, y: cY + 12), control1: CGPoint(x: cX + -1.3, y: cY + 12.55), control2: CGPoint(x: cX + -1.56, y: cY + 12.3))
        
        //path.closeSubpath()
        
        return path
    }
    
}


struct NavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        NotificationButton(buttonAction: {})
    }
}
