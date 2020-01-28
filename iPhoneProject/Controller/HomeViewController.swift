//
//  HomeViewController.swift
//  iPhoneProject
//
//  Created by jeongminho on 2020/01/06.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var cellIdentifier: String = "cell"
    var apps = App.allCases
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = "cell"
        let dequeued = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        guard let cell = dequeued as? AppCollectionViewCell else {
            return dequeued
        }
        
        cell.app = apps[indexPath.item]

        return cell
    }
    
    // MARK: - Delegates
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let identifier = apps[indexPath.item].identifier
        guard let appVC = self.storyboard?.instantiateViewController(identifier: identifier) else { return }
        appVC.modalPresentationStyle = UIModalPresentationStyle.overFullScreen // 중요(확인해보기)
        appVC.modalTransitionStyle = .crossDissolve
        present(appVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let flowLayout: UICollectionViewFlowLayout
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 3, left: 30, bottom: 0, right: 30)
        let width = (collectionView.bounds.width - 150) / 4
        flowLayout.itemSize = CGSize(width: width, height: 83)
    
        self.collectionView.collectionViewLayout = flowLayout
    }
}

