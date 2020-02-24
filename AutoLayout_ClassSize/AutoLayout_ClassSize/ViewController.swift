//
//  ViewController.swift
//  AutoLayout_ClassSize
//
//  Created by JW_Macbook on 2020/01/13.
//  Copyright © 2020 JW_Macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// 화면전환시 마다 나타낼 라벨
    @IBOutlet weak var displayLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 해당 정보를 호출하지 않으면, 초기값에는 해당 함수가 발동하지 않는데.
        // 현재 가지고 있는 가로, 세로 정보 호출해 보기.
        self.traitCollectionDidChange(self.traitCollection)
        
        // Size Class 값
        let horizontal:UIUserInterfaceSizeClass = self.traitCollection.horizontalSizeClass
        let vertical:UIUserInterfaceSizeClass = self.traitCollection.verticalSizeClass
        
        if horizontal == .regular && vertical == .regular {
            print("이렇게도 체크 가능합니다.")
        }
    }

    /// 화면 사이즈 변환시 타는 함수.
    /// AutoLayout r:r, c:r 등 구분함.
    /// - Parameter previousTraitCollection: 가로, 세로 값 들어옵니다.
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
        case (.regular, .regular):
            print("화면전환 r:r 값 (iPad fullSize 가로모드, 세로모드)")
            self.displayLb.text = "regular, regular"

        case (.compact, .compact):
            print("화면전환 c:c 값 (iPhone 가로모드)")
            self.displayLb.text = "compact, compact"

        case (.regular, .compact):
            print("화면전환 r:c 값 (iPad 화면 분활시 Size에 따라 변경됨)")
            self.displayLb.text = "regular, compact"

        case (.compact, .regular):
            print("화면전환 c:r 값 (iPhone 세로모드)")
            self.displayLb.text = "compact, regular"

        default: break
        }
    }

}

