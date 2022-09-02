//
//  MainViewController.swift
//  GzipDecompress
//
//  Created by HwangByungJo  on 2022/09/02.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

    let disposeBag = DisposeBag()
    let viewModel = MainViewModel()

    let gZipTextView = UITextView()
    let arrow = UIImageView()
    let plainTextView = UITextView()
    let stackView = UIStackView()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        attribue()
        layout()
        bind()
    }
}

extension MainViewController {

    private func attribue() {

        self.navigationItem.title = "Gzip Decompress"

        arrow.image = UIImage(systemName: "arrow.right")
        arrow.contentMode = .scaleAspectFit

        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill

        button.setTitle("gunzipped", for: .normal)
        button.backgroundColor = .blue
        button .setTitleColor(.white, for: .normal)
    }

    private func layout() {

        [
            gZipTextView,
            arrow,
            plainTextView
        ].forEach {
            stackView.addArrangedSubview($0)
        }

        gZipTextView.snp.makeConstraints {
            $0.width.equalTo(plainTextView)
        }

        [
            stackView,
            button
        ].forEach {
            view.addSubview($0)
        }

        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalTo(button.snp.top).offset(-10.0)
        }

        button.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(50.0)
        }
    }

    private func bind() {

        gZipTextView.rx.text
            .orEmpty
            .bind(to: viewModel.gzipString)
            .disposed(by: disposeBag)

        viewModel.plainString
            .drive(plainTextView.rx.text)
            .disposed(by: disposeBag)

        button.rx.tap
            .bind(to: viewModel.buttonTapped)
            .disposed(by: disposeBag)
    }
}

