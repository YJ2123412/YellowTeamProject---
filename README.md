# YelloTeamProject

## 깃 명령어 정리

### git bash 초기설정

1. git bash 설정.

```bash
$ git config --global user.name [ $username ]

$ git config --global user.email [ $useremail ]

$ git config --global list
```

2. .gitignore and .git file add Config

-   .gitignore(제외) 파일과 .git(파일의 노드기록 file)로 이루어짐.

```bash
$ git init
```

### 디렉토리 이동

```bash
$ cd .. # ../ 상대적 경로로 현재디렉토리에서 전 디렉토리로 이동
$ cd [ / desktop] # desktop 이라는 앞 경로로 이동
$ cd - # 전에 있었던 디렉토리로 이동(뒤로가기)
$ cd ~ # 사용자의 홈 디렉토리로 이동
$ cd ../.. # 상대적경로로 현재 디렉토리에서 두번 뒤로이동
$ cd / # 루트 디렉토리로 이동
$ cd ./ # 현재 디렉토리
```

### Git repository

-   두가지 방법중 선택.

1. 아직 버전관리를 하지 않는(노드(파일의 포인터)를 기록하지 않는) 로컬 디렉토리 하나를 선택해서 Git 저장소 적용
2. 다른 어딘가에서 Git 저장소를 Clone 하는방법.
   => 시간이 지나서 master -> main branch 라는 이름으로 변경되었으니 참고

-   Git page 는 두가지 방법이 나와있음
    1번째 방법.

```bash
$ cd [/dir/..]
#혹은
$ cd /dir
$ cd /demoproj
$ ls #list 출력 -l옵션은 파일과 디렉토리를 구분해서 접근권한출력, a는 숨겨진 dir 까지 같이 출력.
$ git init
Initialized empty Get repository in D:/[dir]/[dir]
```

### 이렇게 된후..

```bash
user@[desktop name] MINGW64 [dir] (main) $
```

이런식의 문구가 나오면 성공.

### git 레파지토리 생성후..

Code -> https code copy

```bash
# master 경로에서 진행.
$ git remote add origin https://github.com/[username]/[repo name].git
# remote add [https주소] 원력저장소와 연결
$ git remote -v # 연결된 원격 저장소 확인
origin git remote add origin https://github.com/[username]/[repo name].git (fetch)
origin git remote add origin https://github.com/[username]/[repo name].git (push)
```

### 연결진행후

```bash
$ git pull origin main # main branch와 풀동기화.
# pull 동기화 할때 branch 의 명까지 같이 갖고옴.
$ git add .
# 현재 디렉토리 기준 하위 모든 폴더 변경점 추가.
$ git commit -m "1st commit"
# commit -m : message 의 약자. message로 변경점 알아보기 쉽게함. 그러기에 잘적어야 되는부분.

$ git push origin main
# 브렌치에 push 하는 방법은 git push origin [로컬branch명]:[원격branch명]

```

### git push pull

pull : 원격 branch 와 변경점 스테이징<br>
push : 원격 branch에 변경 commit 저장.

```bash
$ git switch [ branch name ]
# 브렌치 switch
$ git switch -b [ branch name ]
# git 체킹과 변경 둘다 함
$ git petch
# 브렌치 패치
$ git checkout [ branch name ]
# 브랜치 체크
$ git branch -d(delete) [ branch name ]
# 브랜치 삭제.
```
