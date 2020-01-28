//
//  App.swift
//  iPhoneProject
//
//  Created by jeongminho on 2020/01/09.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit


enum App: String, CaseIterable {
    // CaseIterable : enumeration case를 collection으로 다루고 싶을때 사용
    case 계산기
    case 카메라
    case 사진
    case 지도
    case 시계
    
    /*
     1. Computed Property: 값을 저장하기 보다는 그때그때 특정한 연산을 통해 값을 리턴한다, Class, Struct, enum에서 사용
     2. computed property는 값이 고정되어 있지 않기 때문에 무조건 var로 선언해야 한다.
     3. rawValue: enum에서 각 항목은 자체로도 하나의 값이지만 항목의 원시 값(raw value)를 가질 수 도 있다.(특정 타입으로 지정된 값을 가질 수 있다.
     4. 타입의 모든 인스턴스에는 self라는 암시적 프로퍼티를 가진다. self 프로퍼티를 사용하여 인스턴스 메소드 내에서 현재 인스턴스를 참조 할 수 있다.
     5. Swift는 메소드 내에서 알려진 프로퍼티 또는 메소드 이름을 사용할 때마다, 현재 instance property 또는 method를 참조한다고 가정. 예외는 인스턴스 메소드의 매개변수 이름이 해당 instance property와 동일한 이름을 가질 때 발생한다. 이때 매개변수 이름이 우선 적용되며 self를 사용하여 매개변수 이름과 프로퍼티 이름을 구분해준다.
    */
    
    var appTitle: String {
        // appTitle을 computed property로 선언해주며 return 값을 각자의 원시 값으로 해준다. case와 함께 선언해주었던 값들이 appTitle에 할당된다.
        return self.rawValue
    }

    var appIcon: UIImage {
        switch self {
        case .계산기: return #imageLiteral(resourceName: "계산기")
        case .사진: return #imageLiteral(resourceName: "사진")
        case .시계: return #imageLiteral(resourceName: "시계")
        case .지도: return #imageLiteral(resourceName: "지도")
        case .카메라: return #imageLiteral(resourceName: "카메라")
        }
    }
    
    var identifier: String {
        switch self {
        case .계산기:
            return "Calculator"
        case .사진:
            return "Picture"
        case .시계:
            return "Clock"
        case .지도:
            return "Map"
        case .카메라:
            return "Camera"
        }
    }
}
