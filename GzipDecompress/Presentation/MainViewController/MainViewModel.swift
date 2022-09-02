//
//  MainViewModel.swift
//  GzipDecompress
//
//  Created by HwangByungJo  on 2022/09/02.
//

import Foundation

import Foundation
import RxSwift
import RxCocoa

struct MainViewModel {
  
  let disposeBag = DisposeBag()
  
  // View -> ViewModel
  let gzipString = PublishRelay<String>()
  let buttonTapped = PublishRelay<Void>()
  
  // ViewModel -> View
  let plainString: Driver<String>
  
  init() {
    
    let plainValue = buttonTapped
      .withLatestFrom(gzipString)
      .compactMap{ $0.gunzipped ?? "" }
    
    plainString = plainValue
      .asDriver(onErrorDriveWith: .empty())
  }
}
