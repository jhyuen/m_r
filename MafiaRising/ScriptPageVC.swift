//
//  ScriptPageVC.swift
//  MafiaRising
//
//  Created by Admin on 6/4/17.
//  Copyright © 2017 Illum. All rights reserved.
//

import UIKit

class ScriptPageVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, UIScrollViewDelegate {
    
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
    var currentIndex = 0
    let slideOffset: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        if let firstVC = VCArray.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        for view in self.view.subviews {
            if let scrollView = view as? UIScrollView {
                scrollView.delegate = self
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let firstVC = VCArray.first {
            setViewControllers([firstVC], direction: .forward, animated: false, completion: nil)
            currentIndex = 0
        }
    }
    
    private func VCInstance (name:String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // dismisses view when it goes off screen
        if currentIndex == 0 && scrollView.contentOffset.x < (scrollView.bounds.size.width - slideOffset) {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
            dismissLeftToRight(theVC: self)
        } else if currentIndex == VCArray.count - 1 && scrollView.contentOffset.x > (scrollView.bounds.size.width + slideOffset) {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
            dismissRightToLeft(theVC: self)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // dismisses view when it goes off screen
        if currentIndex == 0 && scrollView.contentOffset.x < (scrollView.bounds.size.width - slideOffset) {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
            dismissLeftToRight(theVC: self)
        } else if currentIndex == VCArray.count - 1 && scrollView.contentOffset.x > (scrollView.bounds.size.width + slideOffset) {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
            dismissRightToLeft(theVC: self)
        }
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
            // return VCArray.first
            return nil
        }
        
        guard VCArray.count > nextIndex else {
            return nil
        }
        
        return VCArray[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            guard let viewController = pageViewController.viewControllers?.first,
                let index = VCArray.index(of: viewController) else {
                    fatalError("Can't prevent bounce if there is no index")
            }
            currentIndex = index
        }
    }
}
