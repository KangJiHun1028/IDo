//
//  NoticeBoardViewController.swift
//  IDo
//
//  Created by Junyoung_Hong on 2023/10/11.
//

import UIKit
import SnapKit

class NoticeBoardViewController: UIViewController {
    
    private let noticeBoardView = NoticeBoardView()
    private let noticeBoardEmptyView = NoticeBoardEmptyView()
    private let firebaseManager: FirebaseManager
    
    private let club: Club
    
    init(club: Club, firebaseManager: FirebaseManager) {
        self.club = club
        self.firebaseManager = firebaseManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Navigation 관련 함수
//        navigationControllerSet()
//        navigationBarButtonAction()
        
        noticeBoardView.noticeBoardTableView.delegate = self
        noticeBoardView.noticeBoardTableView.dataSource = self
        
        firebaseManager.readNoticeBoard(clubID: club.id)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        firebaseManager.delegate = self
//        if firebaseManager.noticeBoards.isEmpty {
//            view.addSubview(noticeBoardEmptyView)
//            setupView(for: noticeBoardEmptyView)
//        }
//        selectView()
//        firebaseManager.readNoticeBoard(clubID: club.id)
        
    }
    
    private func selectView() {
        if firebaseManager.noticeBoards.isEmpty {
            noticeBoardView.removeFromSuperview()
            if noticeBoardEmptyView.superview == nil {
                view.addSubview(noticeBoardEmptyView)
                setupView(for: noticeBoardEmptyView)
            }
        } else {
            noticeBoardEmptyView.removeFromSuperview()
            if noticeBoardView.superview == nil {
                view.addSubview(noticeBoardView)
                setupView(for: noticeBoardView)
            }
        }
    }
    
    private func setupView(for subView: UIView) {
        subView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }

}

// Navigation 관련 extension
//private extension NoticeBoardViewController {
//    
//    func navigationControllerSet() {
//        
//        // 네비게이션 LargeTitle 비활성화 및 title 입력
//        navigationController?.navigationBar.prefersLargeTitles = false
//        navigationItem.title = "Team.첫사랑(하늬바람)"
//    }
//    
//    func navigationBarButtonAction() {
//        
//        // 네비게이션 오른쪽 버튼 생성
//        let createButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(moveCreateVC))
//        self.navigationItem.rightBarButtonItems = [ createButton ]
//        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(color: .main)
//        
//        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
//        backBarButtonItem.tintColor = UIColor(color: .main)
//        self.navigationItem.backBarButtonItem = backBarButtonItem
//    }
//    
//    // 메모 생성 페이지 이동
//    @objc func moveCreateVC() {
//        let createNoticeBoardVC = CreateNoticeBoardViewController(club: club, firebaseManager: firebaseManager)
//        navigationController?.pushViewController(createNoticeBoardVC, animated: true)
//    }
//}

extension NoticeBoardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firebaseManager.noticeBoards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoticeBoardTableViewCell.identifier, for: indexPath) as? NoticeBoardTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = firebaseManager.noticeBoards[indexPath.row].title
        cell.contentLabel.text = firebaseManager.noticeBoards[indexPath.row].content
        cell.timeLabel.text = firebaseManager.noticeBoards[indexPath.row].createDate.diffrenceDate ?? firebaseManager.noticeBoards[indexPath.row].createDate.dateToString
        cell.nameLabel.text = firebaseManager.noticeBoards[indexPath.row].rootUser.nickName
        cell.commentLabel.text = firebaseManager.noticeBoards[indexPath.row].commentCount
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NoticeBoardDetailViewController(noticeBoard: firebaseManager.noticeBoards[indexPath.row])
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteNoticeBoardAction = UIContextualAction(style: .normal, title: nil) { (action, view, completion) in
            self.firebaseManager.deleteNoticeBoard(at: indexPath.row) { success in
                if success {
                    //tableView.deleteRows(at: [indexPath], with: .automatic)
                    // 삭제 예정(-> 삭제 후 저장이 되었는지 확인 필요)
                    self.firebaseManager.readNoticeBoard(clubID: self.club.id)
                }
            }
            completion(true)
        }
        
        deleteNoticeBoardAction.backgroundColor = .systemRed
        deleteNoticeBoardAction.image = UIImage(systemName: "trash.fill")
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteNoticeBoardAction])
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
    }
}

extension NoticeBoardViewController: FirebaseManagerDelegate {
    func reloadData() {
        selectView()
        noticeBoardView.noticeBoardTableView.reloadData()
    }
    func updateComment(noticeBoardID: String, commentCount: String) {
        guard let index = firebaseManager.noticeBoards.firstIndex(where: { $0.id == noticeBoardID }) else { return }
        firebaseManager.noticeBoards[index].commentCount = commentCount
        reloadData()
    }
}
