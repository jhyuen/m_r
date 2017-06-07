//
//  ScriptPageVC.swift
//  MafiaRising
//
//  Created by Admin on 6/4/17.
//  Copyright © 2017 Illum. All rights reserved.
//

import UIKit

class ScriptPageVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    lazy var VCArray: [UIViewController] = {
        return [self.VCInstance(name: "ScriptVC1"),
                self.VCInstance(name: "ScriptPVC1"),
                self.VCInstance(name: "ScriptPVC2"),
                self.VCInstance(name: "ScriptPVC3"),
                self.VCInstance(name: "ScriptPVC4"),
                self.VCInstance(name: "ScriptVC6"),
                self.VCInstance(name: "ScriptPVC5"),
                self.VCInstance(name: "ScriptPVC6"),
                self.VCInstance(name: "ScriptPVC7"),
                self.VCInstance(name: "ScriptPVC8"),
                self.VCInstance(name: "ScriptVC11"),
                self.VCInstance(name: "ScriptPVC9"),
                self.VCInstance(name: "ScriptVC13")]
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
