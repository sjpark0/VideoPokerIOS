//
//  ViewController.swift
//  VideoPokerSwift
//
//  Created by sjpark on 2023/01/28.
//

import UIKit

class ViewController: UIViewController {
    var m_game : VideoPoker = VideoPoker()
    var m_changeIdx : [Int] = [Int]()
    var m_numChange : Int = 0
    
    @IBOutlet weak var SecondValue: UILabel!
    @IBOutlet weak var FirstValue: UILabel!
    @IBOutlet weak var ThirdValue: UILabel!
    @IBOutlet weak var FourthValue: UILabel!
    @IBOutlet weak var FifthValue: UILabel!
    
    @IBOutlet weak var CheckBox1: UIButton!
    @IBOutlet weak var CheckBox2: UIButton!
    @IBOutlet weak var CheckBox3: UIButton!
    @IBOutlet weak var CheckBox4: UIButton!
    @IBOutlet weak var CheckBox5: UIButton!
    
    @IBOutlet weak var TextInput: UITextField!
    
    @IBOutlet weak var ResultText: UILabel!
    
    var checkBoxArray : [UIButton] = [UIButton]()
    var valueArray : [UILabel] = [UILabel]()
    //var funcArray = Array<(UIButton -> @IBAction)>()
    func ConvertCard(val : String) -> CARD {
        var card : CARD = CARD()
        if val[val.startIndex].isNumber {
            card.SetNumber(number: val[val.startIndex].wholeNumberValue!)
        }
        else{
            switch val[val.startIndex] {
            case "j":
                card.SetNumber(number: 11)
            case "q":
                card.SetNumber(number: 12)
            case "k":
                card.SetNumber(number: 13)
            case "a":
                card.SetNumber(number: 1)
            default:
                card.SetNumber(number : -1)
            }
        }
        
        switch val[val.index(before: val.endIndex)] {
        case "s":
            card.SetType(type: TYPE.CARD_SPADE)
        case "c":
            card.SetType(type: TYPE.CARD_CLOVER)
        case "d":
            card.SetType(type: TYPE.CARD_DIAMOND)
        case "h":
            card.SetType(type: TYPE.CARD_HEART)
        default:
            card.SetType(type: TYPE.UNKNOWN)
        }
          
        card.Print()
        return card
    }
    
    @IBAction func AutoChange(_ sender: UIButton) {
        let numChange : Int = m_numChange
        let changeIdx : [Int] = m_changeIdx
        for i in 0..<numChange{
            checkBoxArray[changeIdx[i]].sendActions(for: .touchUpInside)
        }
        
        let change = m_game.ChangeHandIdx()
        
        for i in 0..<change.numChange {
            checkBoxArray[change.index[i]].sendActions(for: .touchUpInside)
        }
    }
    
    @IBAction func UserInput(_ sender: Any) {
        var inputString : [String] = (TextInput.text!).components(separatedBy: [" "])
        var cardList : [CARD] = [CARD]()
        
        let numChange : Int = m_numChange
        let changeIdx : [Int] = m_changeIdx
        for i in 0..<numChange{
            checkBoxArray[changeIdx[i]].sendActions(for: .touchUpInside)
        }
        
        for tt in inputString{
            cardList.append(ConvertCard(val: tt))
        }
        m_game.GenerateCARD(cards: cardList)
        m_game.PrintHand()
        
        for i in 0..<NUM_HAND {
            valueArray[i].text = m_game.PrintHandForString(index: i)
        }
    //    print(TextInput.text)
        ResultText.text = m_game.PrintResultForString()
    }
    
    @IBAction func Approve(_ sender: UIButton) {
        m_game.ReplaceChangeHandIdx(handIdx: m_changeIdx, numChangeCard: m_numChange)
        m_game.PrintHand()
        
        FirstValue.text = m_game.PrintHandForString(index: 0)
        SecondValue.text = m_game.PrintHandForString(index: 1)
        ThirdValue.text = m_game.PrintHandForString(index: 2)
        FourthValue.text = m_game.PrintHandForString(index: 3)
        FifthValue.text = m_game.PrintHandForString(index: 4)
        
        ResultText.text = m_game.PrintResultForString()
    }
    
    @IBAction func Generator(_ sender: UIButton) {
        
        let numChange : Int = m_numChange
        let changeIdx : [Int] = m_changeIdx
        for i in 0..<numChange{
            checkBoxArray[changeIdx[i]].sendActions(for: .touchUpInside)
        }
        //var game : VideoPoker2 = VideoPoker2()
        //game.TotalProbability()
        
        m_game.GenerateCARD()
        m_game.PrintHand()
        
        for i in 0..<NUM_HAND {
            valueArray[i].text = m_game.PrintHandForString(index: i)
        }
        
        ResultText.text = m_game.PrintResultForString()
        
        /*var game : VideoPoker = VideoPoker()
        var checker : CheckCard = CheckCard()
        var hand : [CARD]
        
        game.GenerateCARDForTest()
        game.PrintHand()
        game.ChangeHand()
        game.PrintHand()
        
        hand = game.GetHand()
        
        checker.Sorting(card: &hand)
        checker.PrintHandCheck(card: hand)*/
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkBoxArray.append(CheckBox1)
        checkBoxArray.append(CheckBox2)
        checkBoxArray.append(CheckBox3)
        checkBoxArray.append(CheckBox4)
        checkBoxArray.append(CheckBox5)
        
        valueArray.append(FirstValue)
        valueArray.append(SecondValue)
        valueArray.append(ThirdValue)
        valueArray.append(FourthValue)
        valueArray.append(FifthValue)
        
        // Do any additional setup after loading the view.
        for i in 0..<NUM_HAND {
            checkBoxArray[i].setImage(UIImage(named:"Uncheckmark"), for: .normal)
            checkBoxArray[i].setImage(UIImage(named:"Checkmark"), for: .selected)
            checkBoxArray[i].tag = i
            checkBoxArray[i].addTarget(self, action: #selector(checkMarkTapped), for: .touchUpInside)
        }
    }

    @IBAction func checkMarkTapped(_ sender: UIButton) {
        if sender.isSelected {
            m_numChange -= 1
            m_changeIdx = m_changeIdx.filter(){$0 != sender.tag}
        }
        else{
            m_numChange += 1
            m_changeIdx.append(sender.tag)
        }
        sender.isSelected = !sender.isSelected
        
        for i in 0..<m_numChange{
            print(m_changeIdx[i])
        }
        print("num of change", m_numChange)
        //sender.tag
    }
}

