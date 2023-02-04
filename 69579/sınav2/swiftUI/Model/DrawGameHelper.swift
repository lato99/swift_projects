//
//  CardGameHelper.swift
//  CardGame
//
//  Created by Gun Makinabakan on 17.10.2022.
//

class DrawGameHelper {
    private var totalWithdraws = 0
    private var deck: [Name] = []
    weak var delegate: NameAppDelegate?

    private var names = Array(0...58)
    
    init() {
        initializeAndShuffleDeck()
    }
    
    private func initializeAndShuffleDeck() {
        deck.removeAll(keepingCapacity: true)
        for i in names {
            let name = Name(userName: i)
            deck.append(name)
        }
        
        deck.shuffle()
        
    }
    
    
    func drawName() -> Name? {
        delegate?.resetUI()
        if deck.count == 0{
            initializeAndShuffleDeck()
        }
        if totalWithdraws == 0 || totalWithdraws == 1 || totalWithdraws == 2 || totalWithdraws == 3 || totalWithdraws == 4{
            totalWithdraws += 1
            return deck.removeFirst()
        }
        
        else if totalWithdraws == 5 {
            totalWithdraws += 1
            delegate?.maxWithDrawn()
            return deck.removeFirst()
        }
        //the else case
        totalWithdraws = 0
        return nil
        
        
        
    }
    
    }
