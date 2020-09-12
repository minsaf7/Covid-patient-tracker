//
//  SurveyViewController.swift
//  NIBM COVID19
//
//  Created by Mohamed Minsaf on 9/1/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import UIKit

struct Question {
   
    let questionText: String
    let options: [String]
    let correctAns: Int
    var wrongAns: Int
    var isAnswered: Bool
}

class SurveyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var myCollectionView: UICollectionView!
    var questionsArray = [Question]()
    var score: Int = 0
    var currentQuestionNumber = 1
    
    var window: UIWindow?
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        self.view.backgroundColor=UIColor.white
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        myCollectionView=UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), collectionViewLayout: layout)
        myCollectionView.delegate=self
        myCollectionView.dataSource=self
        myCollectionView.register(SurveyCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        myCollectionView.showsHorizontalScrollIndicator = false
        myCollectionView.translatesAutoresizingMaskIntoConstraints=false
        myCollectionView.backgroundColor=UIColor.white
        myCollectionView.isPagingEnabled = true
        
        self.view.addSubview(myCollectionView)
        
        let que1 = Question( questionText: "Do you have breathing difficulties or fever ?", options: ["Yes", "No"], correctAns: 0, wrongAns: -1, isAnswered: false)
        let que2 = Question( questionText: "Have you been travelling inbetween last 14 days?", options: ["Yes", "No"], correctAns: 0, wrongAns: -1, isAnswered: false)
        let que3 = Question( questionText: "Have you been exposed to large crowds ?", options: ["Yes", "No"], correctAns: 0, wrongAns: -1, isAnswered: false)
        let que4 = Question( questionText: "Did you interacted with any sick person?", options: ["Yes", "No"], correctAns: 0, wrongAns: -1, isAnswered: false)
//        let que5 = Question( questionText: "Do you have any covid symptoms ?", options: ["Yes", "No"], correctAns: 0, wrongAns: -1, isAnswered: false)
//        let que6 = Question( questionText: "Do you have any covid symptoms ?", options: ["Yes", "No"], correctAns: 0, wrongAns: -1, isAnswered: false)
        questionsArray = [que1, que2, que3, que4]
        
        setupViews()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return questionsArray.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SurveyCollectionViewCell
        cell.question=questionsArray[indexPath.row]
        cell.delegate=self
      //  cell.question = questionsArray[indexPath.row].delegates = self
           return cell
       }
       
       func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           setQuestionNumber()
       }
    

     func setQuestionNumber() {
            let x = myCollectionView.contentOffset.x
            let w = myCollectionView.bounds.size.width
            let currentPage = Int(ceil(x/w))
            if currentPage < questionsArray.count {
                lblQueNumber.text = "Question: \(currentPage+1) / \(questionsArray.count)"
                currentQuestionNumber = currentPage + 1
            }
        }
        
        @objc func btnPrevNextAction(sender: UIButton) {
            if sender == btnNext && currentQuestionNumber == questionsArray.count {
                let surveyVC=SurveyResultViewController()
               surveyVC.score = score
                surveyVC.totalScore = questionsArray.count
                self.navigationController?.pushViewController(surveyVC, animated: false)
                return
            }
            
            let collectionBounds = self.myCollectionView.bounds
            var contentOffset: CGFloat = 0
            if sender == btnNext {
                contentOffset = CGFloat(floor(self.myCollectionView.contentOffset.x + collectionBounds.size.width))
                currentQuestionNumber += currentQuestionNumber >= questionsArray.count ? 0 : 1
            } else {
                contentOffset = CGFloat(floor(self.myCollectionView.contentOffset.x - collectionBounds.size.width))
                currentQuestionNumber -= currentQuestionNumber <= 0 ? 0 : 1
            }
            self.moveToFrame(contentOffset: contentOffset)
            lblQueNumber.text = "Question: \(currentQuestionNumber) / \(questionsArray.count)"
        }
        
        func moveToFrame(contentOffset : CGFloat) {
            let frame: CGRect = CGRect(x : contentOffset ,y : self.myCollectionView.contentOffset.y ,width : self.myCollectionView.frame.width,height : self.myCollectionView.frame.height)
            self.myCollectionView.scrollRectToVisible(frame, animated: true)
        }
        
        func setupViews() {
//            myCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive=true
//            myCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive=true
//            myCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive=true
//            myCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive=true
            
  // myCollectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor ,paddingTop: 10, paddingLeft: 5,  paddingRight: 5)
            
        //  myCollectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,right: view.rightAnchor,paddingTop: 20)
            myCollectionView.backgroundColor = .white
            
            myCollectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,height: 600)
            
            
            

                        self.view.addSubview(lblQueNumber)
            //            lblQueNumber.heightAnchor.constraint(equalToConstant: 20).isActive=true
            //            lblQueNumber.widthAnchor.constraint(equalToConstant: 150).isActive=true
            //            lblQueNumber.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive=true
            //            lblQueNumber.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive=true
           
            
          self.view.addSubview(btnPrev)
//            btnPrev.heightAnchor.constraint(equalToConstant: 50).isActive=true
//            btnPrev.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive=true
//            btnPrev.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive=true
//            btnPrev.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive=true
            
            
         btnPrev.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,  paddingBottom: 5, height: 50, width: 140)
            
            
            
          self.view.addSubview(btnNext)
//            btnNext.heightAnchor.constraint(equalTo: btnPrev.heightAnchor).isActive=true
//            btnNext.widthAnchor.constraint(equalTo: btnPrev.widthAnchor).isActive=true
//            btnNext.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive=true
//            btnNext.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive=true
            
        btnNext.anchor( bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingBottom: 5, paddingRight: -10, height: 50, width: 140)
            
//           let btnStack = UIStackView(arrangedSubviews: [btnPrev,btnNext])
//            btnStack.axis = .horizontal
//            btnStack.distribution = .fillEqually
//            btnStack.spacing = 20
//            btnStack.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 5, paddingBottom: 10, paddingRight: 5)
            
            lblQueNumber.text = "Question: \(1) / \(questionsArray.count)"
                                  lblQueNumber.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: btnPrev.topAnchor,  paddingLeft: 10, paddingBottom: 10, height: 20, width: 150)
                                  
                                  self.view.addSubview(lblScore)
                      //            lblScore.heightAnchor.constraint(equalTo: lblQueNumber.heightAnchor).isActive=true
                      //            lblScore.widthAnchor.constraint(equalTo: lblQueNumber.widthAnchor).isActive=true
                      //            lblScore.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive=true
                      //            lblScore.bottomAnchor.constraint(equalTo: lblQueNumber.bottomAnchor).isActive=true
                                 
                                  lblScore.anchor(bottom: btnNext.topAnchor, right: view.rightAnchor, paddingBottom: 10, paddingRight: -30, height: 20, width: 150)
                                   lblScore.text = "Score: \(score) / \(questionsArray.count)"
            
        }
        
        let btnPrev: UIButton = {
            let btn=UIButton()
            btn.setTitle("< Previous", for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.backgroundColor=UIColor.black
            btn.translatesAutoresizingMaskIntoConstraints=false
            btn.addTarget(self, action: #selector(btnPrevNextAction), for: .touchUpInside)
            return btn
        }()
        
        let btnNext: UIButton = {
            let btn=UIButton()
            btn.setTitle("Next >", for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.backgroundColor=UIColor.black
            btn.translatesAutoresizingMaskIntoConstraints=false
            btn.addTarget(self, action: #selector(btnPrevNextAction), for: .touchUpInside)
            return btn
        }()
        
        let lblQueNumber: UILabel = {
            let lbl=UILabel()
            lbl.text="0 / 0"
            lbl.textColor=UIColor.gray
            lbl.textAlignment = .left
            lbl.font = UIFont.systemFont(ofSize: 16)
            lbl.translatesAutoresizingMaskIntoConstraints=false
            return lbl
        }()
        
        let lblScore: UILabel = {
            let lbl=UILabel()
            lbl.text="0 / 0"
            lbl.textColor=UIColor.gray
            lbl.textAlignment = .right
            lbl.font = UIFont.systemFont(ofSize: 16)
            lbl.translatesAutoresizingMaskIntoConstraints=false
            return lbl
        }()
    }

    extension SurveyViewController: SurveyCollectionViewCellDelegate {
        func didChooseAnswer(btnIndex: Int) {
            let centerIndex = getCenterIndex()
            guard let index = centerIndex else { return }
            questionsArray[index.item].isAnswered=true
            if questionsArray[index.item].correctAns != btnIndex {
                questionsArray[index.item].wrongAns = btnIndex
                score -= 0
            } else {
                score += 1
            }
            lblScore.text = "Score: \(score) / \(questionsArray.count)"
            myCollectionView.reloadItems(at: [index])
        }
        
        func getCenterIndex() -> IndexPath? {
            let center = self.view.convert(self.myCollectionView.center, to: self.myCollectionView)
            let index = myCollectionView!.indexPathForItem(at: center)
            print(index ?? "index not found")
            return index
        }
    // MARK: - Navigation

   

}
