//
//  CARD.swift
//  VideoPokerSwift
//
//  Created by sjpark on 2023/02/11.
//

import Foundation
enum TYPE
{
    case UNKNOWN
    case CARD_SPADE
    case CARD_CLOVER
    case CARD_HEART
    case CARD_DIAMOND
}
typealias NUM_TYPE = Int

extension Array {
    public init(count: Int, createElement: @autoclosure () -> Element) {
        self = (0 ..< count).map { _ in createElement() }
    }
}

class CARD{
    var m_number : NUM_TYPE
    var m_type : TYPE
    
    init(){
        m_number = 0
        m_type = TYPE.UNKNOWN
    }
    init(number : NUM_TYPE, type : TYPE){
        m_number = number
        m_type = type
    }
    func SetNumber(number : NUM_TYPE) -> Void {
        m_number = number
    }
    func SetType(type : TYPE) -> Void {
        m_type = type
    }
    func SetCard(number : NUM_TYPE, type : TYPE) -> Void {
        m_number = number
        m_type = type
    }
    func AssignFrom(card : CARD) -> Void {
        m_number = card.m_number
        m_type = card.m_type
    }
    func GetNumber() -> NUM_TYPE {
        
        return m_number
    }
    func GetType() -> TYPE {
        return m_type
    }

    func IsSameNumber(card : CARD) -> Bool {
        if m_number == card.m_number {
            return true
        }
        else {
            return false
        }
    }
    func IsSameType(card : CARD) -> Bool {
        if m_type == card.m_type {
            return true
        }
        else {
            return false
        }
    }
    func IsSameCard(card : CARD) -> Bool {
        if IsSameNumber(card: card) && IsSameType(card: card) {
            return true
        }
        else{
            return false
        }
    }
    func PrintForString() -> String {
        var result : String = ""
        switch m_number {
        case 1:
            result.append("A,")
        case 11:
            result.append("J,")
        case 12:
            result.append("Q,")
        case 13:
            result.append("K,")
        default:
            result.append(String(m_number))
            result.append(",")
        }
        
        switch m_type {
        case TYPE.CARD_SPADE:
            result.append("Spade")
        case TYPE.CARD_CLOVER:
            result.append("Clover")
        case TYPE.CARD_DIAMOND:
            result.append("Diamond")
        case TYPE.CARD_HEART:
            result.append("Heart")
        default:
            result.append("Unknown")
        }
        return result
    }
    func Print() -> Void {
        switch m_number {
        case 1:
            print("A")
        case 11:
            print("J")
        case 12:
            print("Q")
        case 13:
            print("K")
        default:
            print(m_number)
        }
        
        switch m_type {
        case TYPE.CARD_SPADE:
            print("Spade")
        case TYPE.CARD_CLOVER:
            print("Clover")
        case TYPE.CARD_DIAMOND:
            print("Diamond")
        case TYPE.CARD_HEART:
            print("Heart")
        default:
            print("Unknown")
        }
    }
}
