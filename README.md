# Code Semi-auto Grading Tool

해당 툴은 과제로 제출된 코드를 자동으로 실행하며, 더 빠르고 정확한 TA 업무를 위해 제작되었습니다.

## Dependency

UNIX 계열 운영체제의 개행문자는 `\n`이므로, 윈도우 개행문자인 `\r\n`과 달라 문제가 발생할 수 있습니다.

이를 해결하기 위해 `dos2unix`를 사용하며, 스크립트 안에 포함되어 있으니 설치만 하면 됩니다.

다음 명령어를 사용하여 설치하세요.

```bash
sudo apt install dos2unix
```

## How to use

* `codes` 디렉토리 내에 실행할 `.c` 파일을 모두 저장합니다.
* `test_vector.txt`에 테스트 벡터를 저장합니다. 형식은 다음 문단을 참고하세요.
* `./autogen.sh`를 실행하여 채점 결과를 확인합니다.
* 실행파일을 지우고 싶을 경우 `./clean.sh`를 실행합니다.

