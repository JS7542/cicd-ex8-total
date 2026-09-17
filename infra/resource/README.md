# 인프라 리소스 모듈

이 폴더에는 AWS 리소스를 역할별로 구성하는 8개 모듈과 공통 User Data 템플릿이 있다.

설정값은 `../public-state/terraform.tfvars`에서 변경한다. 각 모듈의 `variables.tf`는 입력 타입을 정의하며 기본값을 두지 않는다. Terraform은 `../public-state`에서 실행한다.

resource 폴더 자체는 별도의 Terraform 실행 루트가 아니다. 이 폴더에서 apply하거나 독립 state를 만들지 않는다.
