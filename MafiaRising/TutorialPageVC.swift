//
//  TutorialPageVC.swift
//  MafiaRising
//
//  Created by Admin on 6/4/17.
//  Copyright © 2017 Illum. All rights reserved.
//

import UIKit

class TutorialPageVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    lazy var VCArray: [UIViewController] = {
        return [self.VCInstance(name: "TutorialVC1"),
                self.VCInstance(name: "TutorialVC2"),
                self.VCInstance(name: "TutorialVC3"),
                self.VCInstance(name: "TutorialVC4"),
                self.VCInstance(name: "TutorialVC5"),
                self.VCInstance(name: "TutorialVC6"),
                self.VCInstance(name: "TutorialVC7"),
                self.VCInstance(name: "TutorialVC8"),
                self.VCInstance(name: "TutorialVC9"),
                self.VCInstance(name: "TutorialVC10"),
                self.VCInstance(name: "TutorialVC11"),
                self.VCInstance(name: "TutorialPVC1"),
                self.VCInstance(name: "TutorialVC14"),
                self.VCInstance(name: "TutorialVC15"),
                self.VCInstance(name: "TutorialVC16"),
                self.VCInstance(name: "TutorialVC17"),
                self.VCInstance(name: "TutorialVC18"),
                self.VCInstance(name: "TutorialPVC2")
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        if let firstVC = VCArray.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let firstVC = VCArray.first {
            setViewControllers([firstVC], direction: .forward, animated: false, completion: nil)
        }
    }
    
    private func VCInstance (name:String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // creates continuous looping of ViewControllers
        guard previousIndex >= 0 else {
            //  return VCArray.last
            return nil
        }
        
        guard VCArray.count > previousIndex else {
            return nil
        }
        
        return VCArray[previousIndex]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        // creates continuous looping of ViewControllers
        guard nextIndex < VCArray.count else {
            return nil
            // return VCArray.first
        }
        
        guard VCArray.count > nextIndex else {
            return nil
        }
        
        return VCArray[nextIndex]
    }
}
