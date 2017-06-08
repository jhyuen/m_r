//
//  ScriptPageVCVert7.swift
//  MafiaRising
//
//  Created by Admin on 6/4/17.
//  Copyright © 2017 Illum. All rights reserved.
//

import UIKit

class ScriptPageVCVert7: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, UIScrollViewDelegate {
    
    lazy var VCArray: [UIViewController] = {
        return [self.VCInstance(name: "ScriptVC9"),
                self.VCInstance(name: "ScriptVC9A")]
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let firstVC = VCArray.first {
            setViewControllers([firstVC], direction: .forward, animated: false, completion: nil)
        }
        currentIndex = 0
    }
    
    private func VCInstance (name:String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // checks if view in bounds of scrollView
        if currentIndex == 0 && scrollView.contentOffset.y < (scrollView.bounds.size.height - slideOffset) {
            // prevents view from leaving  scrollView bounds
            scrollView.contentOffset = CGPoint(x: 0, y: scrollView.bounds.size.height)
            dismissBottomToTop(theVC: self)
        } else if currentIndex == VCArray.count - 1 && scrollView.contentOffset.y > scrollView.bounds.size.height {
            scrollView.contentOffset = CGPoint(x: 0, y: scrollView.bounds.size.height)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // checks if view in bounds of scrollView
        if currentIndex == 0 && scrollView.contentOffset.y < (scrollView.bounds.size.height - slideOffset) {
            // prevents view from leaving scrollView bounds
            scrollView.contentOffset = CGPoint(x: 0, y: scrollView.bounds.size.height)
            dismissBottomToTop(theVC: self)
        } else if currentIndex == VCArray.count - 1 && scrollView.contentOffset.y > scrollView.bounds.size.height {
            scrollView.contentOffset = CGPoint(x: 0, y: scrollView.bounds.size.height)
        }
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // creates continuous looping of ViewControllers if returns VCArray.last
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
        
        // creates continuous looping of ViewControllers if returns VCArray.first
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
            // updates view index
            guard let viewController = pageViewController.viewControllers?.first,
                let index = VCArray.index(of: viewController) else {
                    fatalError("Can't prevent bounce if there is no index")
            }
            currentIndex = index
        }
    }
}
