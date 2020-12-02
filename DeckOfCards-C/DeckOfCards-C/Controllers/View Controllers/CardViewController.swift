//
//  CardViewController.swift
//  DeckOfCards-C
//
//  Created by Nicholas Towery on 12/1/20.
//  Copyright © 2020 DLAB. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    // MARK: - Properties
    var cardsArray: [DLABCard] = []
    
    // MARK: - Outlets
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        drawCard()

    }
    
    
    //MARK: - Functions
    func drawCard() {
        DLABCardController.drawANewCard(1) { (cardArray) in
            guard let cardArray = cardArray else {return}
            self.cardsArray = cardArray
            DLABCardController.fetchCardImage(cardArray[0]) { (image) in
                DispatchQueue.main.async {
                    self.cardLabel.text = ("\(self.cardsArray[0].value) of \(self.cardsArray[0].suit)")
                    self.cardImageView.image = image
                }
            }
        }
    }
    
    
    // MARK: - Actions
    @IBAction func newCardButtonTapped(_ sender: Any) {
        drawCard()
    }
    
}
