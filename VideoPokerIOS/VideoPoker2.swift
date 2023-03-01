//
//  VideoPoker2.swift
//  VideoPokerSwiftConsole
//
//  Created by sjpark on 2023/02/25.
//

import Foundation

class VideoPoker2{

    var m_pChecker : CheckCard
    var m_pHand : [CARD] = [CARD]()
    var m_pAvail : [CARD]
    var m_pRemain : [CARD]

    init(){
        m_pChecker = CheckCard()
        
        m_pHand = [CARD](count : NUM_HAND, createElement : CARD())
        m_pAvail = [CARD](count : NUM_HAND, createElement: CARD())
        m_pRemain = [CARD](count : NUM_TOTAL - NUM_HAND, createElement: CARD())
        
    }
    func ConValToType(val : Int) -> TYPE {
        switch val {
        case 0:
            return TYPE.CARD_SPADE
        case 1:
            return TYPE.CARD_CLOVER
        case 2:
            return TYPE.CARD_HEART
        case 3:
            return TYPE.CARD_DIAMOND
        default:
            return TYPE.UNKNOWN
        }
        
    }
    func GenerateNCard(cardIdx : inout [Int], numTotalCard : Int, numGenCard : Int) -> Void {
        var i = 0
        while i < numGenCard {
            cardIdx[i] = Int.random(in: 0..<numTotalCard)
            for j in 0..<i {
                if cardIdx[i] == cardIdx[j] {
                    i -= 1
                    break
                }
            }
            i += 1
        }
        
    }

    func ChangeOneCARD(card : inout [CARD], handIdx : Int, remainIdx : Int) -> Void {
        card[handIdx].AssignFrom(card: m_pRemain[remainIdx])
    }
    
    func ComputeAvgCreditForNoCardChange(handIdx : [Int]) -> Float {
        return Float(ComputeCredit(card: m_pHand))
    }
    func ComputeAvgCreditForOneCardChange(handIdx : [Int]) -> Float {
        var numTotal : Int = 0;
        var creditTotal : Float = 0.0;
        var tempCARD : [CARD] = [CARD](count: NUM_HAND, createElement: CARD())
        
        for i in 0..<NUM_HAND {
            tempCARD[i].AssignFrom(card: m_pHand[i])
        }

        for i in 0..<(NUM_TOTAL - NUM_HAND) {
            for mm in 0..<NUM_HAND {
                tempCARD[mm].AssignFrom(card: m_pHand[mm])
            }
            
            ChangeOneCARD(card: &tempCARD, handIdx: handIdx[0], remainIdx: i)
            creditTotal += Float(ComputeCredit(card: tempCARD))
            numTotal += 1
        }

        return creditTotal / Float(numTotal)
    }
    func ComputeAvgCreditForTwoCardChange(handIdx : [Int]) -> Float {
        var numTotal : Int = 0;
        var creditTotal : Float = 0.0;
        var tempCARD : [CARD] = [CARD](count: NUM_HAND, createElement: CARD())
        
        for i in 0..<NUM_HAND {
            tempCARD[i].AssignFrom(card: m_pHand[i])
        }

        for i in 0..<(NUM_TOTAL - NUM_HAND) {
            for j in (i+1)..<(NUM_TOTAL - NUM_HAND){
                for mm in 0..<NUM_HAND {
                    tempCARD[mm].AssignFrom(card: m_pHand[mm])
                }
                ChangeOneCARD(card: &tempCARD, handIdx: handIdx[0], remainIdx: i)
                ChangeOneCARD(card: &tempCARD, handIdx: handIdx[1], remainIdx: j)
                
                creditTotal += Float(ComputeCredit(card: tempCARD))
                numTotal += 1
            }
        }
        return creditTotal / Float(numTotal)
    }
    func ComputeAvgCreditForThreeCardChange(handIdx : [Int]) -> Float {
        var numTotal : Int = 0;
        var creditTotal : Float = 0.0;
        var tempCARD : [CARD] = [CARD](count: NUM_HAND, createElement: CARD())
        
        for i in 0..<NUM_HAND {
            tempCARD[i].AssignFrom(card: m_pHand[i])
        }

        for i in 0..<(NUM_TOTAL - NUM_HAND) {
            for j in (i+1)..<(NUM_TOTAL - NUM_HAND){
                for k in (j+1)..<(NUM_TOTAL - NUM_HAND){
                    for mm in 0..<NUM_HAND {
                        tempCARD[mm].AssignFrom(card: m_pHand[mm])
                    }
                    ChangeOneCARD(card: &tempCARD, handIdx: handIdx[0], remainIdx: i)
                    ChangeOneCARD(card: &tempCARD, handIdx: handIdx[1], remainIdx: j)
                    ChangeOneCARD(card: &tempCARD, handIdx: handIdx[2], remainIdx: k)
                    
                    creditTotal += Float(ComputeCredit(card: tempCARD))
                    numTotal += 1
                }
            }
        }
        return creditTotal / Float(numTotal)
    }
    func ComputeAvgCreditForFourCardChange(handIdx : [Int]) -> Float {
        var numTotal : Int = 0;
        var creditTotal : Float = 0.0;
        var tempCARD : [CARD] = [CARD](count: NUM_HAND, createElement: CARD())
        
        for i in 0..<NUM_HAND {
            tempCARD[i].AssignFrom(card: m_pHand[i])
        }

        for i in 0..<(NUM_TOTAL - NUM_HAND) {
            for j in (i+1)..<(NUM_TOTAL - NUM_HAND){
                for k in (j+1)..<(NUM_TOTAL - NUM_HAND) {
                    for l in (k+1)..<(NUM_TOTAL - NUM_HAND){
                        for mm in 0..<NUM_HAND {
                            tempCARD[mm].AssignFrom(card: m_pHand[mm])
                        }
                        ChangeOneCARD(card: &tempCARD, handIdx: handIdx[0], remainIdx: i)
                        ChangeOneCARD(card: &tempCARD, handIdx: handIdx[1], remainIdx: j)
                        ChangeOneCARD(card: &tempCARD, handIdx: handIdx[2], remainIdx: k)
                        ChangeOneCARD(card: &tempCARD, handIdx: handIdx[3], remainIdx: l)
                        
                        creditTotal += Float(ComputeCredit(card: tempCARD))
                        numTotal += 1
                    }
                }
            }
        }
        return creditTotal / Float(numTotal)
    }
    func ComputeAvgCreditForFiveCardChange(handIdx : [Int]) -> Float {
        var numTotal : Int = 0;
        var creditTotal : Float = 0.0;
        var tempCARD : [CARD] = [CARD](count: NUM_HAND, createElement: CARD())
        
        for i in 0..<NUM_HAND {
            tempCARD[i].AssignFrom(card: m_pHand[i])
        }

        for i in 0..<(NUM_TOTAL - NUM_HAND) {
            for j in (i+1)..<(NUM_TOTAL - NUM_HAND){
                for k in (j+1)..<(NUM_TOTAL - NUM_HAND) {
                    for l in (k+1)..<(NUM_TOTAL - NUM_HAND){
                        for m in (l+1)..<(NUM_TOTAL - NUM_HAND){
                            for mm in 0..<NUM_HAND {
                                tempCARD[mm].AssignFrom(card: m_pHand[mm])
                            }
                            ChangeOneCARD(card: &tempCARD, handIdx: handIdx[0], remainIdx: i)
                            ChangeOneCARD(card: &tempCARD, handIdx: handIdx[1], remainIdx: j)
                            ChangeOneCARD(card: &tempCARD, handIdx: handIdx[2], remainIdx: k)
                            ChangeOneCARD(card: &tempCARD, handIdx: handIdx[3], remainIdx: l)
                            ChangeOneCARD(card: &tempCARD, handIdx: handIdx[4], remainIdx: m)
                            
                            creditTotal += Float(ComputeCredit(card: tempCARD))
                            numTotal += 1
                        }
                    }
                }
            }
        }
        return creditTotal / Float(numTotal)
    }

    
    func ComputeCredit(card : [CARD]) -> Int {
        var tempCARD : [CARD] = [CARD](count: NUM_HAND, createElement: CARD())
        
        for i in 0..<NUM_HAND {
            tempCARD[i].AssignFrom(card: card[i])
        }
        
        m_pChecker.Sorting(card: &tempCARD)
        
        return m_pChecker.ReturnCredit(card: tempCARD, bet: 1)
    }
    func PrintCard(card : [CARD], numCard : Int) -> Void {
        for i in 0..<numCard {
            card[i].Print()
        }
    }
    func GetHand() -> [CARD] {
        return m_pHand
    } // test
    func PrintHand() -> Void {
        PrintCard(card: m_pHand, numCard: NUM_HAND)
    } // test
    func GenerateCARD() -> Void {
        var isHand : [Bool] = [Bool](repeating : false, count : NUM_TOTAL)
        var handIdx : [Int] = [Int](repeating : -1, count : NUM_TOTAL)
        
        GenerateNCard(cardIdx : &handIdx, numTotalCard : NUM_TOTAL, numGenCard : NUM_HAND);
        
        for i in 0..<NUM_HAND {
            m_pHand[i].SetCard(number: handIdx[i] / 4 + 1, type: ConValToType(val : handIdx[i] % 4))
            isHand[handIdx[i]] = true
        }
        
        var cntRemain : Int = 0
        for i in 0..<NUM_TOTAL {
            if !isHand[i] {
                m_pRemain[cntRemain].SetCard(number: i / 4 + 1, type: ConValToType(val : i % 4))
                cntRemain += 1
            }
        }
    } // test
    func GenerateCARDForTest() -> Void {
        var isHand : [Bool] = [Bool](repeating : false, count : NUM_TOTAL)
        var handIdx : [Int] = [0, 1, 2, 4, 8]
        
        for i in 0..<NUM_HAND {
            m_pHand[i].SetCard(number: handIdx[i] / 4 + 1, type: ConValToType(val : handIdx[i] % 4))
            isHand[handIdx[i]] = true
        }
        
        var cntRemain : Int = 0
        for i in 0..<NUM_TOTAL {
            if !isHand[i] {
                m_pRemain[cntRemain].SetCard(number: i / 4 + 1, type: ConValToType(val : i % 4))
                cntRemain += 1
            }
        }
    }

    func ComputeOptimumChange(handIdx : inout [Int], numChangeCard : inout Int) -> Float {
        var tempHandIdx : [Int] = [Int](repeating : -1, count : NUM_HAND)
        var credit : Float = 0.0
        
        var optimumCredit : Float = ComputeAvgCreditForNoCardChange(handIdx: handIdx)
        numChangeCard = 0;
        
        for i in 0..<NUM_HAND {
            tempHandIdx[0] = i
            credit = ComputeAvgCreditForOneCardChange(handIdx: tempHandIdx)
            
            if credit > optimumCredit {
                optimumCredit = credit
                numChangeCard = 1
                for idx in 0..<numChangeCard {
                    handIdx[idx] = tempHandIdx[idx]
                }
            }
        }
        //print(numChangeCard, optimumCredit)
        
        for i in 0..<NUM_HAND {
            for j in (i + 1)..<NUM_HAND {
                tempHandIdx[0] = i;
                tempHandIdx[1] = j;
                credit = ComputeAvgCreditForTwoCardChange(handIdx: tempHandIdx)
                
                if credit > optimumCredit {
                    optimumCredit = credit
                    numChangeCard = 2
                    for idx in 0..<numChangeCard {
                        handIdx[idx] = tempHandIdx[idx]
                    }
                }
                
            }
        }
        //print(numChangeCard, optimumCredit)
        
        for i in 0..<NUM_HAND {
            for j in (i + 1)..<NUM_HAND {
                for k in (j+1)..<NUM_HAND {
                    tempHandIdx[0] = i;
                    tempHandIdx[1] = j;
                    tempHandIdx[2] = k;
                    credit = ComputeAvgCreditForThreeCardChange(handIdx: tempHandIdx)
                    
                    if credit > optimumCredit {
                        optimumCredit = credit
                        numChangeCard = 3
                        for idx in 0..<numChangeCard {
                            handIdx[idx] = tempHandIdx[idx]
                        }
                    }
                }
                
            }
        }
        //print(numChangeCard, optimumCredit)
        
        for i in 0..<NUM_HAND {
            for j in (i + 1)..<NUM_HAND {
                for k in (j+1)..<NUM_HAND {
                    for l in (k+1)..<NUM_HAND {
                        tempHandIdx[0] = i;
                        tempHandIdx[1] = j;
                        tempHandIdx[2] = k;
                        tempHandIdx[3] = l;
                        credit = ComputeAvgCreditForFourCardChange(handIdx: tempHandIdx)
                        
                        if credit > optimumCredit {
                            optimumCredit = credit
                            numChangeCard = 4
                            for idx in 0..<numChangeCard {
                                handIdx[idx] = tempHandIdx[idx]
                            }
                        }
                    }
                }
                
            }
        }
        //print(numChangeCard, optimumCredit)
        
        for i in 0..<NUM_HAND {
            for j in (i + 1)..<NUM_HAND {
                for k in (j+1)..<NUM_HAND {
                    for l in (k+1)..<NUM_HAND {
                        for m in (l+1)..<NUM_HAND {
                            tempHandIdx[0] = i;
                            tempHandIdx[1] = j;
                            tempHandIdx[2] = k;
                            tempHandIdx[3] = l;
                            tempHandIdx[4] = m;
                            credit = ComputeAvgCreditForFiveCardChange(handIdx: tempHandIdx)
                            
                            if credit > optimumCredit {
                                optimumCredit = credit
                                numChangeCard = 5
                                for idx in 0..<numChangeCard {
                                    handIdx[idx] = tempHandIdx[idx]
                                }
                            }
                        }
                    }
                }
                
            }
        }
        //print(numChangeCard, optimumCredit)
        
        return optimumCredit;
    }
    func ChangeHand() -> Void {
        var handIdx : [Int] = [Int](repeating : -1, count : NUM_HAND)
        var numChangeCard : Int = 0
        var optimumCredit : Float
        
        optimumCredit = ComputeOptimumChange(handIdx: &handIdx, numChangeCard: &numChangeCard)
        
        print(optimumCredit)
        /*print(numChangeCard, "Card Change!!")
        for i in 0..<numChangeCard {
            print(handIdx[i])
        }*/
        
        var changeIdx : [Int] = [Int](repeating: -1, count: numChangeCard)
        GenerateNCard(cardIdx: &changeIdx, numTotalCard: NUM_TOTAL - NUM_HAND, numGenCard: numChangeCard)
        
        for i in 0..<numChangeCard {
            m_pHand[handIdx[i]].AssignFrom(card: m_pRemain[changeIdx[i]])
        }
    }

    func TotalProbability() -> Void {
        var isHand : [Bool]
        var handIdx : [Int] = [Int](repeating : 0, count : NUM_HAND)
        var numChangeCard : Int = 0
        var cntRemain : Int
        var optimumCredit : Float
        var numGame : Int = 0
        var totalCredit : Float = 0.0
        
        for c1 in 0..<NUM_TOTAL {
            for c2 in (c1+1)..<NUM_TOTAL {
                for c3 in (c2+1)..<NUM_TOTAL {
                    for c4 in (c3+1)..<NUM_TOTAL {
                        for c5 in (c4+1)..<NUM_TOTAL {
                            isHand = [Bool](repeating: false, count: NUM_TOTAL)
                            m_pHand[0].SetCard(number: c1 / 4 + 1, type: ConValToType(val: c1 % 4))
                            m_pHand[1].SetCard(number: c2 / 4 + 1, type: ConValToType(val: c2 % 4))
                            m_pHand[2].SetCard(number: c3 / 4 + 1, type: ConValToType(val: c3 % 4))
                            m_pHand[3].SetCard(number: c4 / 4 + 1, type: ConValToType(val: c4 % 4))
                            m_pHand[4].SetCard(number: c5 / 4 + 1, type: ConValToType(val: c5 % 4))
                            isHand[c1] = true
                            isHand[c2] = true
                            isHand[c3] = true
                            isHand[c4] = true
                            isHand[c5] = true
                            
                            cntRemain = 0
                            for i in 0..<NUM_TOTAL {
                                if !isHand[i] {
                                    m_pRemain[cntRemain].SetCard(number: i/4+1, type: ConValToType(val: i % 4))
                                    cntRemain += 1;
                                }
                            }
                            
                            optimumCredit = ComputeOptimumChange(handIdx: &handIdx, numChangeCard: &numChangeCard)
                            totalCredit += optimumCredit
                            numGame += 1
                            print("Probability", numGame, optimumCredit, totalCredit)
                            //if numGame % 10 == 0 {
                            //    print("Probability", numGame, totalCredit, Float(totalCredit) / Float(numGame))
                            //}
                        }
                    }
                }
            }
        }
        print("Total Probability", numGame, totalCredit, Float(totalCredit) / Float(numGame))
    }
}

