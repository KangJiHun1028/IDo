<br>

# 👍🏻iDo

### **사람들과 관심사 또는 취미를 공유해보세요!**
### **다같이 즐길 수 있도록 도와드릴게요!**

<br>

## 목차
- [📆 프로젝트 기간](#-프로젝트-기간)
- [⭐️ 프로젝트 소개](#️-프로젝트-소개)
- [📚 구현 기능](#-구현-기능)
- [👩🏻‍💻 Contributors](#-contributors)
- [⚙️ Tech Stack](️#️-tech-stack)
- [🏹 사용한 라이브러리](#-사용한-라이브러리)
- [⚡️ 라이브러리 사용 이유](️#️-라이브러리-사용-이유)
- [🔫 트러블 슈팅](#-트러블-슈팅)

<br>

## 📆 프로젝트 기간

2023년 10월 10일 ~ 2023년 11월 17일 (6주)

<br>

## ⭐️ 프로젝트 소개
### 쉽게 모임을 통해 많은 사람들과 함께 취미와 관심사를 즐길 수 있는 커뮤니티 앱
iDo는 카테고리를 통해 좀 더 쉽게 같은 취미를 가진 사람들과 어울릴 수 있습니다. <br>
<br>

### 프로젝트 목표
내성적인 사람을 포함한 2030세대 모두가 어려움 없이 같이 취미를 공유한다는 즐거움을 느낄 수 있도록 기회를 제공하는 것이 목표입니다. <br>

<br>

## 📚 구현 기능
    
0. **공통**
    - [x] 로그인 유저 데이터 동기화
    - [x] 가입 유저 데이터 동기화
    - [x] 이미지 캐싱 작업
    
   <br>

1. **로그인/회원가입 페이지**
    - [x] 아이디 및 비밀번호 비교
   <img src="https://github.com/KangJiHun1028/IDo/assets/136081642/dcd95679-0d2c-4d20-9538-209a7ea153b2"></a>
    - [x] 이메일 유효성 검사 (중복 가입 방지)
    - [x] 이메일을 이용한 인증번호
    - [x] 비밀번호 유효성 검사 (영문자, 숫자, 특수기호 필수)
    
    <br>
  
3. **홈 페이지**
    - [x] 가입한 모임 목록 표시
    - [x] 가입한 모임으로 이동
    
    <br>
    
4. **카테고리 페이지**
    - [x] 9가지 카테고리 중 1가지 선택
    
    <br>
    
5. **모임 페이지**
    - [x] 모임 커버 이미지, 모임 이름, 모임 소개 표시
    - [x] 가입 멤버 목록
    - [x] 모임장 표시
    - [x] 프로필 이미지 클릭 시, 해당 유저 프로필 확인
    - [x] 모임 생성 
    - [x] 모임 생성 시, 3:2 비율로 자르기
    
    <br>

6. **게시글 페이지**
    - [x] 제목, 내용, 이미지, 작성 시간 표시
    - [x] 게시글 추가/삭제/수정 기능
    - [x] 댓글 추가/삭제/수정 기능
    - [x] 프로필 이미지 클릭 시, 해당 유저 프로필 확인
    - [x] 게시글 신고하기
    - [x] 댓글 신고하기
    
    <br>

7. **마이 프로필 페이지**
    - [x] 나의 프로필 조회
    - [x] 프로필 수정
    - [x] 로그아웃, 서비스 탈퇴
    
    <br>
    
<br>

## 👩🏻‍💻 Contributors

| [홍준영](https://github.com/wnsdud0721) | [김도현](https://github.com/jingni1115) | [강지훈](https://github.com/KangJiHun1028) | [한동연](https://github.com/Direchan) | [이애라](https://github.com/aera11) |
| :----------------------------------: | :---------------------------------------: | :-----------------------------------: | :-----------------------------------: | :------------------------------------: |
|               ☀️ 리더                 |                ️🌙 부리더                    |               🛠️ 개발자                 |                🛠️ 개발자                |                🛠️ 개발자                   |
|       게시글 목록/게시글 생성 및 수정       |                 게시글 상세/댓글            |                 회원가입                 |               모임 생성/수정              |                 홈 화면                    |
|              회원탈퇴                 |                 이미지 캐싱                  |                 로그아웃                  |            이미지 유효성 검사 기능          |                마이 프로필 화면            |
|              신고기능                 |                 신고기능                    |                 카테고리                  |               이미지 편집                |                상단 로고 추가              |

<br>

## ⚙️ Tech Stack

<br>

<img src="https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=Xcode&logoColor=white"/></a>
<img src="https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=Swift&logoColor=white"/></a>
<img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=Firebase&logoColor=white"/></a>

<br>
<div align="left">

## 🏹 사용한 라이브러리

1. [Firebase](https://github.com/firebase/firebase-ios-sdk)
2. [SnapKit](https://github.com/SnapKit/SnapKit)
3. [Tabman](https://github.com/uias/Tabman)
4. [TOCropViewController](https://github.com/TimOliver/TOCropViewController)

<br>

## ⚡️ 라이브러리 사용 이유
   
1. ***Firebase*** <br>
    로그인 및 회원가입 진행 시 `유저의 데이터를 가져오고 비교하기 위해` Authentication에 데이터 동기화를 위해서 사용 <br>
    모임/게시글/댓글 등 `각각 콘텐츠의 CRUD 기능을 위한 데이터를 활용하기 위해` Realtime에 데이터 동기화를 위해서 사용 <br>
    콘텐츠, 유저와 관련된 `이미지를 관리하고 캐싱하기 위해` Storage에 이미지 저장을 위해서 사용 <br>
   
2. ***SnapKit*** <br>
    `코드 기반 UI 작업의 효율성`을 높이기 위해서 사용
    `Auto Layout`을 쉽게 설정하기 위해 사용
   
3. ***Tabman*** <br>
    `상단 탭바 추가`를 위해 사용
   
4. ***TOCropViewController*** <br>
    `이미지 비율을 3:2로 편집`을 쉽게 하기 위해 사용
 
<br>

## 🔫 트러블 슈팅

### 페이지 별 데이터 동기화

#### 1. 화면 이동 시, 데이터 동기화가 제대로 이루어지지 않음
- 원인 : 각 페이지마다 데이터를 관리하는 Manager 클래스를 각각 인스턴스화 시켜서 사용
  ```swift
  private let firebaseManager = FirebaseManager()
  ```
- 해결 : 초기화 시, 상위 페이지이의 Manager 클래스 인스턴스를 전달 받아서 사용
  ```swift
  var firebaseManager: FirebaseManager
    
  init(firebaseManager: FirebaseManager) {
      self.firebaseManager = firebaseManager
      super.init(nibName: nil, bundle: nil)
  }
    
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  ```
  
#### 2. 각 페이지마다 유저 정보를 새롭게 부르거나 접근을 해야함
- 원인 : 유저가 콘텐츠를 즐기거나, 화면과 상호작용을 할 때 마다 사용자의 정보를 불러오고 있음. 즉, 앱을 사용할 때 사용자와 함께 이동하는 정보 저장 요소가 없음
- 해결 : 로그인회원가입 시 생성된 유저정보를 싱글톤으로 관리
  ```swift
  final class MyProfile {
    
      static let shared = MyProfile()
      private var firebaseManager: MyProfileUpdateManager!
      private var ref: DatabaseReference = Database.database().reference()
      private var fileCache: ProfileImageCache = ProfileImageCache()
      var myUserInfo: MyUserInfo?
    
      private init() {}
		  .
		  .
		  .
  }
  ```
  ```swift
  // 사용 예시
  DispatchQueue.main.async {
      guard let nickName = MyProfile.shared.myUserInfo?.nickName else { return }
      self.instructions.text = "\(nickName)님, 카테고리를 선택해보세요!"
  }
  ```

<br>

### UI 업데이트

#### 1. 데이터가 처리되기 전에, 화면 전환이 끝나서 원하는 결과가 보여지지 않음
- 원인 : 데이터 처리가 완료되는 시점을 알 수 없음, 순차적으로 진행이 되게 하는 로직이 없음
- 해결 : 데이터 처리 함수에 `completion` 을 추가해서 데이터 처리가 완료된 시점에 화면 전환이 이루어지게 함
  ```swift
  func createNoticeBoard(title: String, content: String, completion: @escaping (Bool) -> Void) {
      let ref = Database.database().reference().child("noticeBoards").child(club.id)
      let newNoticeBoardID = ref.childByAutoId().key ?? ""
      .
		  .
		  .
      self.uploadImages(noticeBoardID: newNoticeBoardID, imageList: self.newSelectedImage) { success, imageURLs in
          if success {
              .
						  .  
						  .
                  completion(success)
              }
          } else {
              completion(false)
          }
      }
  }
  ```
  ```swift
  // 사용 예시
  // 새로운 메모 작성
  @objc func finishButtonTappedNew() {
      navigationItem.rightBarButtonItem?.isEnabled = false
        
      if isTitleTextViewEdited, isContentTextViewEdited {
          guard let newTitleText = createNoticeBoardView.titleTextView.text else { return }
          guard let newContentText = createNoticeBoardView.contentTextView.text else { return }
            
          firebaseManager.createNoticeBoard(title: newTitleText, content: newContentText) { success in
              if success {
                  self.navigationController?.popViewController(animated: true)
                  print("게시판 생성 성공")
              }
              else {
                  self.navigationItem.rightBarButtonItem?.isEnabled = true
                  print("게시판 생성 실패")
              }
          }
      }
      else {
          navigationItem.rightBarButtonItem?.isEnabled = true
      }
  }
  ```

#### 2. 데이터를 View에 전달한 후에, View가 reload 되지 않음
- 원인 : 데이터는 Manager 클래스에서 관리하고, 뷰는 ViewController에서 관리함
- 해결 : Delegate 패턴을 사용하여, 데이터 관련 함수가 호출될 때 해당 TableView reload
  ```swift
  protocol FirebaseManagerDelegate: AnyObject {
    func reloadData()
  }
  class FirebaseManager {
      weak var delegate: FirebaseManagerDelegate?
		  .
		  .
		  .
      {
          if success {
              self.addMyNoticeBoard(noticeBoard: newNoticeBoard)
              self.noticeBoards.insert(newNoticeBoard, at: 0)
              self.delegate?.reloadData()
          }
      }
		  .
		  .
  }
  ```
  ```swift
  // 사용 예시 - ViewController에서 해당 protocol 상속
  extension NoticeBoardViewController: FirebaseManagerDelegate {
      func reloadData() {
          selectView()
          noticeBoardView.noticeBoardTableView.reloadData()
      }
  }
  ```

<br>

### 이미지 비율 및 다운로드 속도

#### 1. 선택된 이미지의 비율이 깨져서 보임
- 원인 : 이미지와 버튼의 크기가 다름, 이미지를 강제로 컴포넌트에 맞추기 때문에 이미지가 3:2 비율이 아니라면 부자연스럽게 늘어나거나, 축소됨
  <p align="left">
    <img src="https://github.com/FiveI-s/IDo/assets/92636626/c1481e87-ac6f-4402-96ed-90cd884a811d" alt="이미지와 버튼의 크기가 다름" width="300" style="margin-right: 16px;"/>
    <img src="https://github.com/FiveI-s/IDo/assets/92636626/e9154c5d-b231-4146-9b48-53b75c5374b0" alt="이미지가 부자연스럽게 들어감" width="300"/>
  </p>
- 해결 : 이미지 버튼 사이즈를 3:2로 변경, TOCropViewController 라이브러리 사용하여 이미지 추가 시, 이미지 편집
  ```swift
  let cropViewController = TOCropViewController(croppingStyle: .default, image: selectedImage)
  cropViewController.delegate = self
  cropViewController.customAspectRatio = CGSize(width: 3, height: 2) // 비율 3:2
  cropViewController.aspectRatioLockEnabled = true // 비율 선택 잠금
  cropViewController.resetAspectRatioEnabled = false // 비율 리셋 막음
  cropViewController.aspectRatioPickerButtonHidden = true // 비율 변경 토글 히든

  picker.dismiss(animated: true) {
      self.present(cropViewController, animated: true, completion: nil)
  }
  ```
  <p align="left">
    <img src="https://github.com/FiveI-s/IDo/assets/92636626/364ecee6-83cf-4586-a476-0db502a585cb" alt="라이브러리 적용 후, 이미지 편집" width="300" style="margin-right: 16px;"/>
    <img src="https://github.com/FiveI-s/IDo/assets/92636626/1d95bfce-840c-451a-9045-57055086196a" alt="적용 결과" width="300"/>
  </p>

#### 2. 이미지 다운로드 속도가 느림
- 원인 : 사용자가 보는 이미지에 비해 매우 큰 사이즈의 이미지를 저장하고 불러오기 때문, Firebase Storage는 따로 캐싱작업을 해주지 않음
- 해결 : compressionQuality 를 사용하여 이미지를 압축하여 저장, storage에 metadata에 있는 md5hash값과 로컬에 있는 이미지 데이터를 md5hash로 변환하여 비교하여 다를 경우 서버에서 이미지를 가져와 캐싱된 이미지를 변경함
  ```swift
  if let image = profileImageButton.image(for: .normal) {
      imageData = image.jpegData(compressionQuality: 0.5) // 이미지 품질
  }
  ```
  ```swift
  extension Data {
      var md5Hash: String {
          let hash = Insecure.MD5.hash(data: self)
          return Data(hash).base64EncodedString()
      }
  }
  ```
  ```swift
  //사용 예시
  if let localDataHash = cacheImage.pngData()?.md5Hash,
     let storageDataHash = metadata?.md5Hash,
     localDataHash == storageDataHash {
     return
  }
  ```

<br>

### 기기 별 레이아웃 조정

#### 1. 기기에 따라서 컴포넌트의 레이아웃이 깨짐
- 원인 : 기기 별로 화면의 크기가 다름, 오토레이아웃을 정확한 수치로 지정
  ```swift
  // 높이를 수치로 설정
  meetingDescriptionTextView.snp.makeConstraints { make in
      make.top.equalTo(countMeetingNameLabel.snp.bottom).offset(Constant.margin4)
      make.centerX.equalTo(scrollView)
      make.left.right.equalTo(scrollView).inset(Constant.margin4)
      make.height.equalTo(160)
  }
  ```
  <p align="left">
    <img src="https://github.com/FiveI-s/IDo/assets/92636626/d9135f68-20a0-4331-952b-54a5f982f91c" alt="iPhone 15 Pro" width="300" style="margin-right: 16px;"/>
    <img src="https://github.com/FiveI-s/IDo/assets/92636626/98d5f79d-9815-4e93-84b3-2cf743ccb8c4" alt="iPhone SE" width="300"/>
  </p>
- 해결 : lessThanOrEqualTo과 greaterThanOrEqualTo 이용해서 레이아웃 설정
   ```swift
  // 높이의 최대, 최소 지정
  meetingDescriptionTextView.snp.makeConstraints { make in
      make.top.equalTo(countMeetingNameLabel.snp.bottom).offset(Constant.margin4)
      make.centerX.equalTo(scrollView)
      make.left.right.equalTo(scrollView).inset(Constant.margin4)
      make.height.lessThanOrEqualTo(160)
		  make.height.greaterThanOrEqualTo(100)
  }
  ```
  <p align="left">
    <img src="https://github.com/FiveI-s/IDo/assets/92636626/6cf738d2-4ebf-444d-a112-d20624a3983a" alt="iPhone 15 Pro" width="300" style="margin-right: 16px;"/>
    <img src="https://github.com/FiveI-s/IDo/assets/92636626/f2a9bf79-1efe-4fe6-aba4-dca2dfe237aa" alt="iPhone SE" width="300"/>
  </p>

<br>
