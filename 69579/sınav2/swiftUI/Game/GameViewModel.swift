//
//  GameViewModel.swift
//  swiftUI
//
//  Created by Lutfu on 3.01.2023.
//
 


//All the business logic belong to here
import SwiftUI
class GameViewModel: ObservableObject { //Observable -- Any change on that object can be observed by a view, or a struct
    
    
    private let nameAppHelper = DrawGameHelper()

    

    @Published var firstNumber = " "
    @Published var secondNumber = " "
    @Published var thirdNumber = " "
    @Published var fourthNumber = " "
    @Published var fifthNumber = " "
    @Published var sixthNumber = " "
    
    
    @Published var drawButtontitle = "DRAW"
    

    
    
    
    init(){
        nameAppHelper.delegate = self
        
    }
    
    
    
    

    
    
    func returnFirstNumber(){
        
        let name = nameAppHelper.drawName()
        if(firstNumber == " "){
            if let name{
                firstNumber = String(name.userName)
            }
            let name2 = nameAppHelper.drawName()
            if let name2{
                secondNumber = String(name2.userName)
            }
            let name3 = nameAppHelper.drawName()
            if let name3{
                thirdNumber = String(name3.userName)
            }
            let name4 = nameAppHelper.drawName()
            if let name4{
                fourthNumber = String(name4.userName)
            }
            let name5 = nameAppHelper.drawName()
            if let name5{
                fifthNumber = String(name5.userName)
            }
            let name6 = nameAppHelper.drawName()
            if let name6{
                sixthNumber = String(name6.userName)
            }
        }

        else{
            firstNumber = " "
            secondNumber = " "
            thirdNumber = " "
            fourthNumber = " "
            fifthNumber = " "
            sixthNumber = " "
        }
    }
    
    
    
}
 
extension GameViewModel: NameAppDelegate{
    func resetUI() {
        drawButtontitle = "DRAW"
    }
    func maxWithDrawn() {
        drawButtontitle = "CLEAR"
    }
    
    
}
