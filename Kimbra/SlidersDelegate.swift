//
//  SlidersDelegate.swift
//  Kimbra
//
//  Created by Antony Yang on 6/11/15.
//  Copyright (c) 2015 Arash Namvar. All rights reserved.
//

import UIKit


protocol SlidersViewDelegate: class {
    func slidersViewController(controller: SlidersViewController)
}

protocol SlidersDelegate: class {
    func slideChangeMainView(controller: UIViewController)
}