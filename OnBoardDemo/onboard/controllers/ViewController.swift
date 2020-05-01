//
//  ViewController.swift
//  OnBoardDemo
//
//  Created by yadhukrishnan E on 01/05/20.
//  Copyright © 2020 AYA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var cvOnBoards: UICollectionView!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnFinish: UIButton!
    
    var boards: [Board] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCV()
        setupBoardingData()
    }

    func setupCV() {
        cvOnBoards.delegate = self
        cvOnBoards.dataSource = self
    }
    
    @IBAction func onSkipClicked(_ sender: Any) {
        print("--------- ViewController -- onSkipClicked ----------")
    }
    
    @IBAction func onFinishClicked(_ sender: Any) {
        print("--------- ViewController -- onFinishClicked ----------")
    }
    
    
}

extension ViewController {
    
    func setupBoardingData() {
           let one = Board()
           one.heading = "Easy to use"
           one.description = "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups."
           one.image = "slide_1"
           one.color = "#698FB7"
           boards.append(one)
           
           let two = Board()
           two.heading = "Connectivity"
           two.description = "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups."
           two.image = "slide_2"
           two.color = "#6AB1B7"
           boards.append(two)
           
           let three = Board()
           three.heading = "Latest Feeds"
           three.description = "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups."
           three.image = "slide_3"
           three.color = "#9C8FBF"
           boards.append(three)
           
           cvOnBoards.reloadData()
       }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.pageController.numberOfPages = boards.count
        return boards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_on_board", for: indexPath) as! OnBoardCVCell
        cell.setBoard(board: boards[indexPath.row])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.tag == 0) {
            let center = CGPoint(x: scrollView.contentOffset.x + (scrollView.frame.width / 2), y: (scrollView.frame.height) / 2)
            if let ip = self.cvOnBoards.indexPathForItem(at: center) {
                cvOnBoards.backgroundColor = UIColor(hexa: boards[ip.row].color)
                self.pageController.currentPage = ip.row
                if (pageController.currentPage == (boards.count - 1)) {
                    self.btnFinish.isHidden = false
                } else {
                    self.btnFinish.isHidden = true
                }
            }
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}

