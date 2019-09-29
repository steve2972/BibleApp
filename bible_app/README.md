# 한국복음서원 성경 앱

개발자들 환영합니다! 저희는 한국복음서원 앱개발팀입니다. 이 프로젝트는 Flutter를 사용한 한국복음서원 성경 포털 앱입니다. 기존 iSilo과 Google Play의 연동이 만료되어 회복성경을 제공해 드리는 새로움 앱이 필요하여 개발 중인 앱입니다.

## 시작하기 전에 

### Prerequisites
이 프로젝트를 실행하기 위해 개발환경을 구축해야하는 몇 가지의 필수 조건들이 있습니다.
- 운영체제: Windows 7 SPI 이후 (64-bit) / macOS(64-bit) 이후
- 저장공간: 적어도 2.8GB
- 도구: Mac일 경우 [macOS를 위한 Flutter](https://flutter.dev/docs/get-started/install/macos)를 참고하시기 바랍니다.
  - [Windows Powershell 5.0](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-windows-powershell?view=powershell-6) (윈도우 10에 기본적으로 깔려 있습니다)
  - [Git for Windows 2.x](https://git-scm.com/download/win)

### Installation
그 다음, [Flutter공식 홈페이지](https://flutter.dev/docs/get-started/install/windows)에 들어가서 Flutter SDK를 다운 받으신 후, PATH 변수에 flutter\bin을 추가할 것입니다.

Command Line을 통해 다음 코드를 실행하여 flutter가 정상적으로 다운 되었는지 확인해야합니다.

```C:\src\flutter> flutter doctor```

Flutter가 정상적으로 설치가 된 후에, 편하신 에디터로 clone 받고, 업데이트를 하기 위하여 `git pull origin master`를 실행해 주십시오. 

Happy Coding!

### For Flutter Beginners
Flutter 프로젝트를 처음 하시는 분들을 위하여 다음 링크를 제공해 드립니다.

- [Flutter를 처음 배우시는 분들을 위하여](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: 여러 가지의 Flutter 샘플로 언어를 익히기 위하여](https://flutter.dev/docs/cookbook)

더 많은 정보를 위해, 플러터 공식 웹사이트
[Flutter](https://flutter.dev/docs) 에 들어가서 튜토리얼,
샘플들과 API documentation을 참고하시기 바랍니다.

## 친절한 개발 환경을 위한 규칙

1) **master branch에 직접 push하지 않기 바랍니다.** 본인의 코드가 다른 개발환경에 돌아가지 않을 수 있으니 품질 제어를 위해 master에 직접적인 push를 제한하고 있습니다. 로컬 branch에서 개발 후 pull request를 *꼭* 신청해주세요. 되도록 빠른 pull검토를 하겠습니다.

## License
This project is licensed with the MIT license: see License.md
