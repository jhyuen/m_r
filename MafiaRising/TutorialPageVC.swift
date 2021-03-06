//
//  TutorialPageVC.swift
//  MafiaRising
//
//  Created by Admin on 6/4/17.
//  Copyright © 2017 Illum. All rights reserved.
//

import UIKit

class TutorialPageVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, UIScrollViewDelegate {
    
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
                self.VCInstance(name: "TutorialVC13"),
                self.VCInstance(name: "TutorialVC14"),
                self.VCInstance(name: "TutorialVC15"),
                self.VCInstance(name: "TutorialVC16"),
                self.VCInstance(name: "TutorialVC17"),
                self.VCInstance(name: "TutorialVC18"),
                self.VCInstance(name: "TutorialPVC2")
        ]
    }()
    
    var currentIndex = 0
    let slideOffset: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = VCArray.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        for view in self.view.subviews {
            if let scrollView = view as? UIScrollView {
                scrollView.delegate = self
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let firstVC = VCArray[tutorialProgress]
        setViewControllers([firstVC], direction: .forward, animated: false, completion: nil)
        currentIndex = tutorialProgress
    }
    
    private func VCInstance (name:String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // dismisses view when it goes off screen
        tutorialProgress = currentIndex
        if currentIndex == 0 && scrollView.contentOffset.x < (scrollView.bounds.size.width - slideOffset) {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
            tutorialProgress = 0
            dismissLeftToRight(theVC: self)
        } else if currentIndex == VCArray.count - 1 && scrollView.contentOffset.x > (scrollView.bounds.size.width + slideOffset) {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
            tutorialProgress = 0
            dismissRightToLeft(theVC: self)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // dismisses view when it goes off screen
        if currentIndex == 0 && scrollView.contentOffset.x < (scrollView.bounds.size.width - slideOffset) {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
            dismissLeftToRight(theVC: self)
            tutorialProgress = 0
        } else if currentIndex == VCArray.count - 1 && scrollView.contentOffset.x > (scrollView.bounds.size.width + slideOffset) {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
            tutorialProgress = 0
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
