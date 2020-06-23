# Group8
##### 🤓 깃초보 예슬이가 알려주는 깃 사용법

- 마스터시점 : 

  - 초기 setting이 필요해요!

    1. Git Repository를 생성해주세요. (자세한건 아팟장님의 ios git bash 참조)

    2. Git Repository를 로컬에 클론해주세요.  

    <code>git clone [ 주소 ]</code>

    3. Xcode에서 프로젝트를 만들어주세요.

    4. 필요에 따라 폴더링, pod init, podfile 수정, pod install, info.plist 수정, Assets 다운, **.gitignore 설정** 등등.. 초기 셋팅을 모두 마쳐주세요! 

       [^.gitignore란?]: 저장소에 업로드하지 않을 파일의 규칙을 정의하는 파일

       터미널 내 깃 로컬에서 <code>touch .gitignore</code>

       그럼 로컬에 빈 .gitignore 파일이 생기쥬?

       [gitignore.io 접속](https://www.toptal.com/developers/gitignore) → 아래와 같이 원하는 키워드를 넣어주고 생성을 누릅니당.

       <img src="/Users/iyeseul/SOPT_local/Group8/img/ignore.png" alt="ignore" style="zoom:40%;" />

       생성된 코드를 아까 만든 .gitignore 파일 내용으로 복붙해주고 저장하면 끄읏~ 저는 vi에디터가 불편하기 때문에 파인더에서 그냥 텍스트편집기로 해요. 편할대로 하심 댑니다~!

  - 팀원이 브랜치도 파고~ 플젝이 한창 진행중일 때~ 각자의 브랜치에서 push하면 master 브랜치에서 merge 해주면됩니당

    1. 레포 원격저장소로 갑니다!

