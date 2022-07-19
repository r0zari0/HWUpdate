//
//  ViewController.swift
//  HWUpdate
//
//  Created by Max Stovolos on 7/16/22.
//

import UIKit

//MARK: - NewContactVC

class ViewController: UIViewController {

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
}
    //MARK: - Privat Extention
    
private extension ViewController {
    
    func setUpUI() {
        creatAddButton()
        
    }
    
    func creatAddButton() {
        let changeAColor = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(editButton))
        
        navigationItem.rightBarButtonItem = changeAColor
    }
    
    @objc
    func editButton() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SecondPage") as! ChangeColorVC
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

