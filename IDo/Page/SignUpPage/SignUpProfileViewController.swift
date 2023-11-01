//
//  SingUpProfileViewController.swift
//  IDo
//
//  Created by 김도현 on 2023/10/23.
//

import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import UIKit

class SignUpProfileViewController: UIViewController {
    private let email: String
    private let password: String
    private let selectedCategorys: [String]
    private var user: IDoUser?
    private let fbUserDatabaseManager: FirebaseCreateUserManager = .init(refPath: ["Users"])
    private let imagePickerViewController: UIImagePickerController = .init()

    private let profileImageView: UIImageView = .init(image: UIImage(systemName: "camera.circle.fill"))
    private let nickNameTextField: UITextField = {
        let textField = UITextField()
        textField.font = .bodyFont(.large, weight: .regular)
        textField.textColor = UIColor(color: .textStrong)
        textField.placeholder = "닉네임을 입력해주세요(10자 이내)"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor(color: .white), for: .normal)
        button.backgroundColor = UIColor(color: .contentPrimary)
        button.layer.cornerRadius = 5
        return button
    }()

    private var nickName: String = ""

    init(email: String, password: String, selectedCategorys: [String]) {
        self.email = email
        self.password = password
        self.selectedCategorys = selectedCategorys
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        // Do any additional setup after loading the view.
    }
}

private extension SignUpProfileViewController {
    func setup() {
        addViews()
        setupAutoLayout()
        setupTextField()
        setupImagePicker()
        setupImageView()
        setupButton()
    }

    func addViews() {
        view.addSubview(profileImageView)
        view.addSubview(nickNameTextField)
        view.addSubview(signUpButton)
    }

    func setupAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(safeArea).inset(Constant.margin3)
            make.centerX.equalTo(safeArea)
            make.width.height.equalTo(90)
        }
        nickNameTextField.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(Constant.margin2)
            make.left.right.equalTo(safeArea).inset(Constant.margin4)
        }
        signUpButton.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(safeArea).inset(Constant.margin3)
        }
    }

    func setupTextField() {
        nickNameTextField.delegate = self
    }

    func setupImageView() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(profileImagePick))
        profileImageView.addGestureRecognizer(gesture)
        profileImageView.isUserInteractionEnabled = true
        profileImageView.layoutIfNeeded()
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        profileImageView.layer.masksToBounds = true
    }

    @objc func profileImagePick() {
        present(imagePickerViewController, animated: true)
    }

    func setupImagePicker() {
        imagePickerViewController.sourceType = .photoLibrary
        imagePickerViewController.delegate = self
    }

    func setupButton() {
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }

    @objc func signUp() {
        guard !nickName.isEmpty else {
            showAlert(message: "닉네임을 입력해주세요")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authDataResult, error in
            guard let self = self else { return }
            if let error {
                self.showAlert(message: "로그인에 실패하였습니다.")
                return
            }
            guard let authDataResult = authDataResult else { return }
            let uid = authDataResult.user.uid
            var user = IDoUser(id: uid, updateAt: Date().toString(), email: email, nickName: self.nickName, hobbyList: self.selectedCategorys)
            self.fbUserDatabaseManager.model = user
            self.fbUserDatabaseManager.appendData(data: user)
            self.fbUserDatabaseManager.addImage(uid: uid, image: profileImageView.image)
            self.firebaseLogin()
        }
    }

    func showAlert(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }

    func firebaseLogin() {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if let error {
                print("Login Error: \(error.localizedDescription)")
                return
            }
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(TabBarController(), animated: true)
        }
    }
}

extension SignUpProfileViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return range.location < 10
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        nickName = text
    }
}

extension SignUpProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true) {
            if let image = info[.editedImage] as? UIImage {
                self.profileImageView.image = image
            } else if let image = info[.originalImage] as? UIImage {
                self.profileImageView.image = image
            }
        }
    }
}
