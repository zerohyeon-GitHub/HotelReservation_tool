//
//  main.swift
//  HotelReservation_tool
//
//  Created by t2023-m0059 on 2023/07/21.
//

import Foundation

//lv1 : 호텔 예약 관리를 위한 Swift 프로그램을 작성하세요.
// 1. 사용자가 호텔 예약을 할 수 있는 메뉴를 표시하세요. 아래 사용자가 사용할 수 있는 기능(1,2,3 등 번호 입력)들을 보여주고, 선택 시 해당 기능을 실행하고, 종료되었으면 다시 호텔 예약 메뉴를 표시하세요.
// 2. 사용자가 '1'을 선택하면 랜덤 금액을 지급하여 잔고에 더하고 출력해주세요(랜덤 금액 : 10만원~50만원, 10000원 단위로)
// 3. 사용자가 '2'을 선택하면 호텔 방 정보를 출력하세요(1번방 1박 10000원, 2번방 1박 20000원, 3번방 1박 30000원, 4번방 1박 40000원, 5번방 1박 50000원)

let marklist = markList() // 호텔 예약 프로그램 실행 Class
let hotelreservation = hotelReservation() // 호텔 기능 Class
var appEndorNot: Bool = false

var page: String = "main"

class markList{
    
    var inputNumber: String = "" // readLine()으로 입력되는 String 값
    var selectNumber: Int = 1 // inputNumber을 Int 형식으로 변경
    var isNumber: Bool = true
    var selectNumberComplete: Bool = false
    var displayList: Bool = true // 목록을 한번만 보여주기 위해 설정
    
    func FuncSelection() -> Int{
        while(selectNumberComplete == false){
            if(displayList) {
                print("---------------------------------------")
                print("* 호텔 예약 관리 프로그램 *")
                print("1. 랜덤 금액 지급")
                print("2. 호텔 객실 정보 보기")
                print("3. 호텔 객실 예약하기")
                print("4. 나의 예약 목록 보기")
                print("5. 나의 예약 목록 체크인 날짜 순으로 보기")
                print("6. 예약 삭제하기")
                print("7. 예약 수정하기")
                print("8. 나의 입출금 내역 출력하기")
                print("9. 나의 잔액 보기")
                print("0. 프로그램 종료하기")
                print("---------------------------------------")
                print("원하시는 기능의 번호를 입력해 주세요.")
                
                displayList = false // 처음만 표시
            }
            
            // readLind()으로 번호를 입력받는다.
            inputNumber = readLine()!
            // 입력받은 문자열에서 정수로만 이루어져있는지 확인한다.
            for number in inputNumber { // 입력받은 문자열을 문자 하나씩 확인
                if(number.isNumber == true){
                    isNumber = true
                } else { // 입력받은 문자열이 숫자가 아니다 - Error
                    isNumber = false
                    print("Error : 문자가 입력되었습니다. 0 ~ 9 숫자만 입력해주세요.")
                }
            }
            
            // 숫자로 이루어진 것을 확인한 후 Int 변환을 한다.
            if(isNumber){
                selectNumber = Int(inputNumber)! // Int형 변환
                if(selectNumber >= 0 && selectNumber <= 9){
                    print("숫자 선택 완료 : \(selectNumber)")
                    selectNumberComplete = true
                } else { // 지정된 범위를 벗어났음 - Error
                    print("Error : 선택할 수 없는 번호입니다!!!")
                    selectNumberComplete = false
                }
            }
        }
        displayList = true
        selectNumberComplete = false
        return selectNumber
    }
}

// 사용자 정보
struct UserInfo {
    var userMoney: Int
}

var user_1 = UserInfo(userMoney: 0) // 사용자가 정보 입력

// 호텔 방 배열 선언
var roomDicArray: Array<Dictionary<String, Any>> = []
var roomDic_1 :Dictionary<String, Any> = [ // Any를 쓰게 되면 출력 시 Optional을 감싸준다.
    "roomName": "1번방",
    "roomCost": 10000,
    "roomStatus": false
]
var roomDic_2 :Dictionary<String, Any> = [
    "roomName": "2번방",
    "roomCost": 20000,
    "roomStatus": false
]
var roomDic_3 :Dictionary<String, Any> = [
    "roomName": "3번방",
    "roomCost": 30000,
    "roomStatus": false
]
var roomDic_4 :Dictionary<String, Any> = [
    "roomName": "4번방",
    "roomCost": 40000,
    "roomStatus": false
]
var roomDic_5 :Dictionary<String, Any> = [
    "roomName": "5번방",
    "roomCost": 50000,
    "roomStatus": false
]
// Array에 ditionary 데이터 삽입
roomDicArray.append(roomDic_1)
roomDicArray.append(roomDic_2)
roomDicArray.append(roomDic_3)
roomDicArray.append(roomDic_4)
roomDicArray.append(roomDic_5)

class hotelReservation {
    
    func reservationFunc(funcNum: Int){
        switch funcNum{
        case 1:
            function_1()
            break
        case 2:
            function_2()
            break
        case 3:
            // 호텔 방 예약을 받으세요. 사용자로부터 호텔방 번호, 체크인 날짜, 체크아웃 날짜를 입력받아 예약을 완료하세요. 호텔 방 예약 가능시(가능 조건은 회의하여 결정) 금액을 차감하고, 가능하지 않을 시 오류 메시지를 출력하세요
            break
        case 4:
            // 나의 예약 목록을 출력하세요. 예약된 방의 목록을 보여주고, 각 예약 정보를 출력하세요.
            break
        case 5:
            // 예약 목록을 체크인 날짜순으로 정렬하여 출력하세요. (배열 정렬 기능 활용)
            break
        case 6:
            // 예약 목록이 보이고, 목록에서 번호를 선택하여 삭제 가능, 환불금 입금
            break
        case 7:
            // 예약 목록이 보이고, 목록에서 번호를 선택하여 방 변경 가능, 차액에 따라 입금 혹은 출금
            break
        case 8:
            // 입출금 내역 목록을 출력 "랜덤 금액으로 입금됨, 환불금으로 입금됨, 예약으로 출금됨, 수정시 차액만큼 입금되거나 출금됨 등"
            break
        case 9:
            // 잔액을 천원 단위에서 컴마(,) 넣어서 잔액 출력 예시) 12,500원
            break
        case 0:
            function_0()
            break
        default:
            break
        }
    }
    
    // Program 종료
    func function_0(){
        print("Program을 종료합니다.")
        exit(0)
    }
    
    // 랜덤 금액을 지급하여 잔고에 더하고 출력해주세요(랜덤 금액 : 10만원~50만원, 10000원 단위로)
    func function_1(){
        print("1. 랜덤 금액 지급")
        print("현재 잔고 : \(user_1.userMoney)")
        // 10 ~ 50 사이의 숫자를 랜덤하여 표시
        var money_10000 = Int.random(in: 10...50) // 만원 단위
        money_10000 = money_10000 * 10000
        print("추가 입금 금액 : \(money_10000)")
        user_1.userMoney += money_10000 // 기존에 있는 금액에 추가적인 금액을 더 입금
        print("입금 후 금액 : \(user_1.userMoney)")
    }
    
    // 호텔 방 정보를 출력하세요(1번방 1박 10000원, 2번방 1박 20000원, 3번방 1박 30000원, 4번방 1박 40000원, 5번방 1박 50000원)
    func function_2(){
        print("2. 호텔 객실 정보 보기")
        for i in 0..<roomDicArray.count{ // ... = ..<
            print("room : \(roomDicArray[i]["roomName"] ?? "test"), \(roomDicArray[i]["roomCost"]),")
        }
    }
}

//if let roomStr = roomDicArray[i]["roomName"] { // 이게 만약에 nil이면 출력을 하지 않음. // 옵셔널 바인딩 or Guard or default문 사용 ----- ! 사용은 지양
//}

var SelectedFunction: Int = 0

while(true) {
    SelectedFunction = marklist.FuncSelection() // 사용자가 선택한 기능
    hotelreservation.reservationFunc(funcNum: SelectedFunction)
}
