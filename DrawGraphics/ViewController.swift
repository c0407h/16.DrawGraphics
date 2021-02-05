//
//  ViewController.swift
//  DrawGraphics
//
//  Created by 이충현 on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnDrawLine(_ sender: UIButton) {
        //콘텍스트를 이미지 뷰의 크기와 같게 생성
        UIGraphicsBeginImageContext(imgView.frame.size)
        // 생성한 콘텍스트 정보를 context 변수에 가져온다
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Line
        //아래는 콘텍스트에 대한 여러가지 설정을 한다
        
        // 선의 굵기를 설정 (2.0은 원하는 굵기고 바꿔도 무관)
        context.setLineWidth(2.0)
        // 선의 색상 설정 (컬러는 빨강으로 해봄)
        context.setStrokeColor(UIColor.red.cgColor)
        
        // 그림을 그리기 위해서 시작 위치로 커서를 이동시킨다
        // (0,0)은 화면의 왼쪽 윗부분의 지표, 여기서 시작 위치를 (70,50) 으로 지정하였다
        context.move(to: CGPoint(x: 70, y:50))
        // 현재 위치에서 지정한 위치까지 선 추가
        // 여기서의 임의로 (270,250)을 입력햇다
        context.addLine(to: CGPoint(x: 270, y: 250))
        
        //추가한 경로를 콘텍스트에 그린다.
        context.strokePath()
        
        //Draw Triangle
        // 위의 Draw Line에서 사용한 방법으로 삼각형을 그린다.
        // 색상은 파란색, 삼각형의 꼭지점이 세개이므로 context.addLine좌표를 다르게 하여 세번 입력
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 270, y: 350))
        context.addLine(to: CGPoint(x: 70, y: 350))
        context.addLine(to: CGPoint(x: 170, y: 200))
        context.strokePath()
        
        //현재 콘텍스트에 그려진 이미지를 가지고 와서 이미지 뷰에 나타낸다
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        //그림 그리기를 끝낸다
        UIGraphicsEndImageContext()
        
        
    }
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
    
        // Draw Rectangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        // XY좌표(70,100)에서  시작하고 폭이 200 픽셀(px), 높이가 200픽셀(px)인 사각형을 그린다
        //이때 시작하는 좌표인(70,100)은 완서된 사각형에서 왼쪽 위으 꼭지점을 말한다
        context.addRect(CGRect(x: 70, y: 100, width: 200, height: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
    }
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        
        //Draw Ellipse
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.green.cgColor)
        
        // XY좌표 (70,50)에서 시작하고 폭이 200픽셀, 높이가 100 픽셀인 사각형 안에 내접하는 타원을 그린다
        context.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 100))
        context.strokePath()
        
        //Draw Circle
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        // XY 좌표(70,200)에서 시작하고 폭이 200픽셀, 높이가 200픽셀인 사각형 안에 내접하는 원을그린다.
        // 폭과 높이를 같게 설정하면 우너을 그릴 수 있다.
        context.addEllipse(in: CGRect(x: 70, y: 200, width: 200, height: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    
    @IBAction func btnDrawArc(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Arc
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 100, y: 50))
        context.addArc(tangent1End: CGPoint(x: 250, y: 50), tangent2End: CGPoint(x: 250, y: 200), radius: CGFloat(50))
        context.addLine(to: CGPoint(x: 250, y: 200))
        
        context.move(to: CGPoint(x: 100, y: 250))
        context.addArc(tangent1End: CGPoint(x: 270, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    @IBAction func btnDrawFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Rectangle
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        //도형의 내부를 색상으로 채운다. red자리에 다른 색상 값이 들어갈 수 있음
        context.setFillColor(UIColor.red.cgColor)
        
        let rectangle = CGRect(x: 70, y: 50, width: 200, height: 100)
        context.addRect(rectangle)
        // 사각형의 내부를 색상으로 채운다
        context.fill(rectangle)
        context.strokePath()
        
        //Draw Circle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setFillColor(UIColor.blue.cgColor)

        let circle = CGRect(x: 70, y: 200, width: 200, height: 100)
        context.addEllipse(in: circle)
        context.fillEllipse(in: circle)
        context.strokePath()
        
        
        //Draw Triangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 350))
        context.addLine(to: CGPoint(x: 270, y: 450))
        context.addLine(to: CGPoint(x: 70, y:450))
        context.addLine(to: CGPoint(x: 170, y:350))
        context.fillPath()
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
}

