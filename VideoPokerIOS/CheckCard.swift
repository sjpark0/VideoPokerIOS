//
//  CheckCard.swift
//  VideoPokerSwift
//
//  Created by sjpark on 2023/02/11.
//

import Foundation
let NUM_TOTAL:Int = 52
let NUM_HAND:Int =  5

class CheckCard{
    var m_creditJackBetter : Int
    var m_creditTwoPair : Int
    var m_creditTriple : Int
    var m_creditStraight : Int
    var m_creditFlush : Int
    var m_creditFullHouse : Int
    var m_creditFourCARD : Int
    var m_creditStraightFlush : Int
    var m_creditRoyalFlush : Int
    init(){
        m_creditJackBetter = 1
        m_creditTwoPair = 2
        m_creditTriple = 3
        m_creditStraight = 4
        m_creditFlush = 6
        m_creditFullHouse = 9
        m_creditFourCARD = 25
        m_creditStraightFlush = 50
        m_creditRoyalFlush = 800
    }
    
    func IsOnePair(card : [CARD]) -> Bool {
        if card[0].IsSameNumber(card : card[1])
            || card[1].IsSameNumber(card : card[2])
            || card[2].IsSameNumber(card : card[3])
            || card[3].IsSameNumber(card : card[4]) {
               return true
           }
        else {
            return false
        }
    }
    func IsJackBetter(card : [CARD]) -> Bool {
        if ((card[0].IsSameNumber(card : card[1]) && (card[0].GetNumber() >= 11 || card[0].GetNumber() == 1)) ||
            (card[1].IsSameNumber(card : card[2]) && (card[1].GetNumber() >= 11 || card[1].GetNumber() == 1)) ||
            (card[2].IsSameNumber(card : card[3]) && (card[2].GetNumber() >= 11 || card[2].GetNumber() == 1)) ||
            (card[3].IsSameNumber(card :card[4]) && (card[3].GetNumber() >= 11 || card[3].GetNumber() == 1))) {
                return true;
            }
        else {
            return false
        }
    }
    func IsTwoPair(card : [CARD]) -> Bool {
        if ((card[0].IsSameNumber(card : card[1]) && card[2].IsSameNumber(card : card[3])) ||
            (card[0].IsSameNumber(card : card[1]) && card[3].IsSameNumber(card : card[4])) ||
            (card[1].IsSameNumber(card : card[2]) && card[3].IsSameNumber(card : card[4]))){
                return true;
            }
        else {
            return false
        }
    }
    func IsTriple(card : [CARD]) -> Bool {
        if (card[0].IsSameNumber(card : card[2]) ||
            card[1].IsSameNumber(card : card[3]) ||
            card[2].IsSameNumber(card : card[4])) {
                return true;
            }
        else {
            return false
        }
    }
    func IsFlush(card : [CARD]) -> Bool {
        if (card[0].IsSameType(card : card[1]) && card[0].IsSameType(card : card[2]) && card[0].IsSameType(card : card[3]) && card[0].IsSameType(card : card[4])) {
               return true;
           }
        else {
            return false
        }
    }
    func IsStraight(card : [CARD]) -> Bool {
        if (card[0].GetNumber() == card[1].GetNumber() - 1 &&
                card[1].GetNumber() == card[2].GetNumber() - 1 &&
                card[2].GetNumber() == card[3].GetNumber() - 1 &&
                card[3].GetNumber() == card[4].GetNumber() - 1) {
                return true;
            }
            else if (card[0].GetNumber() == 1 &&
                card[1].GetNumber() == 10 &&
                card[2].GetNumber() == 11 &&
                card[3].GetNumber() == 12 &&
                card[4].GetNumber() == 13) {
                return true;
            }
        else {
            return false
        }
    }
    func IsFullHouse(card : [CARD]) -> Bool {
        if ((card[0].IsSameNumber(card : card[2]) && card[3].IsSameNumber(card : card[4])) ||
            (card[0].IsSameNumber(card : card[1]) && card[2].IsSameNumber(card : card[4]))) {
               return true;
           }
        else {
            return false
        }
    }
    func IsFourCARD(card : [CARD]) -> Bool {
        if (card[0].IsSameNumber(card : card[3]) ||
            card[1].IsSameNumber(card : card[4])) {
                return true;
            }
        else {
            return false
        }
    }
    func IsStraightFlush(card : [CARD]) -> Bool {
        if (IsFlush(card : card) && IsStraight(card : card)) {
                return true;
            }
        else {
            return false
        }
    }
    func IsRoyalFlush(card : [CARD]) -> Bool {
        if (IsFlush(card : card)) {
               if (card[0].GetNumber() == 1 &&
                   card[1].GetNumber() == 10 &&
                   card[2].GetNumber() == 11 &&
                   card[3].GetNumber() == 12 &&
                   card[4].GetNumber() == 13) {
                   return true;
               }
            else {
                return false
            }
           }
        else {
            return false
        }
    }
    func SetCredit(cdJackBetter : Int, cdTwoPair : Int, cdTriple : Int, cdStraight : Int, cdFlush : Int, cdFullHouse : Int, cdFourCARD : Int, cdStrightFlush : Int, cdRoyalFlush : Int) -> Void {
        m_creditJackBetter = cdJackBetter;
        m_creditTwoPair = cdTwoPair;
        m_creditTriple = cdTriple;
        m_creditStraight = cdStraight;
        m_creditFlush = cdFlush;
        m_creditFullHouse = cdFullHouse;
        m_creditFourCARD = cdFourCARD;
        m_creditStraightFlush = cdStrightFlush;
        m_creditRoyalFlush = cdRoyalFlush;
    }
    func ReturnCredit(card : [CARD], bet : Int) -> Int {
        if (IsRoyalFlush(card : card)) {
            return bet * m_creditRoyalFlush;
        }
        else if (IsStraightFlush(card : card)) {
            return bet * m_creditStraightFlush;
        }
        else if (IsFourCARD(card : card)) {
            return bet * m_creditFourCARD;
        }
        else if (IsFullHouse(card : card)) {
            return bet * m_creditFullHouse;
        }
        else if (IsFlush(card : card)) {
            return bet * m_creditFlush;
        }
        else if (IsStraight(card : card)) {
            return bet * m_creditStraight;
        }
        else if (IsTriple(card : card)) {
            return bet * m_creditTriple;
        }
        else if (IsTwoPair(card : card)) {
            return bet * m_creditTwoPair;
        }
        else if (IsJackBetter(card : card)) {
            return bet * m_creditJackBetter;
        }
        else {
            return 0
        }
    }
    func PrintHandCheckForString(card : [CARD]) -> String {
        if (IsRoyalFlush(card : card)) {
            return "Royal Flush";
        }
        else if (IsStraightFlush(card : card)) {
            return "Straight Flush";
        }
        else if (IsFourCARD(card : card)) {
            return "Four CARD";
        }
        else if (IsFullHouse(card : card)) {
            return "Full House";
        }
        else if (IsFlush(card : card)) {
            return "Flush";
        }
        else if (IsStraight(card : card)) {
            return "Straight";
        }
        else if (IsTriple(card : card)) {
            return "Triple";
        }
        else if (IsTwoPair(card : card)) {
            return "Two Pair";
        }
        else if (IsJackBetter(card : card)) {
            return "Jack Better";
        }
        else if (IsOnePair(card : card)) {
            return "One Pair";
        }
        else {
            return "Nothing";
        }
    }
    func PrintHandCheck(card : [CARD]) -> Void {
        if (IsRoyalFlush(card : card)) {
            print("Royal Flush");
        }
        else if (IsStraightFlush(card : card)) {
            print("Straight Flush");
        }
        else if (IsFourCARD(card : card)) {
            print("Four CARD");
        }
        else if (IsFullHouse(card : card)) {
            print("Full House");
        }
        else if (IsFlush(card : card)) {
            print("Flush");
        }
        else if (IsStraight(card : card)) {
            print("Straight");
        }
        else if (IsTriple(card : card)) {
            print("Triple");
        }
        else if (IsTwoPair(card : card)) {
            print("Two Pair");
        }
        else if (IsJackBetter(card : card)) {
            print("Jack Better");
        }
        else if (IsOnePair(card : card)) {
            print("One Pair\n");
        }
        else {
            print("Nothing");
        }
    } // test
    func Sorting(card : inout [CARD]) -> Void {
        var tempCARD : CARD = CARD()
        
        for i in 0..<NUM_HAND {
            for j in (i+1)..<NUM_HAND {
                if (card[i].GetNumber() > card[j].GetNumber()) {
                    tempCARD.AssignFrom(card : card[i]);
                    card[i].AssignFrom(card : card[j]);
                    card[j].AssignFrom(card : tempCARD);
                }
            }
        }
    }// test
}
