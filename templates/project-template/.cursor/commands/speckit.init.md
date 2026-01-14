# speckit.init

Spec-Kit 기반 신규 프로젝트를 초기화합니다.

## 목적

`${GITHUB_BASE_PATH}` 템플릿을 기반으로 새로운 프로젝트를 생성합니다.
- Cursor IDE 커맨드 복사
- PowerShell 스크립트 복사
- 템플릿 및 문서 복사
- 프로젝트 헌법 생성
- Git 저장소 초기화

## 입력 필요

사용자에게 다음 정보를 확인하세요:

1. **프로젝트 이름** (필수)
   - 영문, 숫자, 하이픈만 사용 권장
   - 예: `my-awesome-app`, `admin-dashboard`

2. **생성 경로** (선택, 기본값: `${GITHUB_BASE_PATH}`)
   - 프로젝트가 생성될 상위 디렉토리

3. **샘플 스펙 포함 여부** (선택, 기본값: 아니오)
   - 스펙 템플릿을 샘플로 포함할지 여부

## 실행 방법

### 방법 1: PowerShell 스크립트 직접 실행

터미널에서 다음 명령을 실행하세요:

```powershell
# 기본 사용
${GITHUB_BASE_PATH}/.specify/scripts/powershell/init-project.ps1 -ProjectName "{{PROJECT_NAME}}"

# 다른 경로에 생성
${GITHUB_BASE_PATH}/.specify/scripts/powershell/init-project.ps1 -ProjectName "{{PROJECT_NAME}}" -TargetPath "{{TARGET_PATH}}"

# 샘플 스펙 포함
${GITHUB_BASE_PATH}/.specify/scripts/powershell/init-project.ps1 -ProjectName "{{PROJECT_NAME}}" -IncludeSampleSpec

# Git 초기화 건너뛰기
${GITHUB_BASE_PATH}/.specify/scripts/powershell/init-project.ps1 -ProjectName "{{PROJECT_NAME}}" -SkipGit
```

### 방법 2: AI 어시스턴트가 스크립트 실행

사용자가 프로젝트 이름과 옵션을 제공하면, 위 PowerShell 명령을 터미널에서 실행합니다.

## 생성되는 구조

```
{{PROJECT_NAME}}/
├── .cursor/commands/       # Cursor IDE 커맨드
│   ├── speckit.specify.md
│   ├── speckit.plan.md
│   ├── speckit.tasks.md
│   ├── speckit.implement.md
│   └── ...
├── .specify/
│   ├── memory/
│   ├── scripts/powershell/ # 자동화 스크립트
│   └── templates/          # 템플릿
├── docs/                   # 가이드 문서
│   ├── spec-kit-guide.md
│   ├── best-practices.md
│   └── ...
├── specs/                  # 기능 명세서 (빈 폴더)
├── constitution.md         # 프로젝트 헌법
└── .gitignore
```

## 완료 후 Handoff

프로젝트 생성 완료 후:

1. **Cursor로 프로젝트 열기**
   ```
   cursor "{{TARGET_PATH}}\{{PROJECT_NAME}}"
   ```

2. **constitution.md 커스터마이징**
   - 프로젝트 목적 정의
   - 기술 스택 명시
   - 코딩 표준 설정

3. **첫 번째 스펙 작성**
   - `/speckit.specify` 커맨드로 첫 번째 기능 스펙 작성 시작

## 예시 대화

```
사용자: 새 프로젝트 만들어줘
AI: 프로젝트 이름을 알려주세요.

사용자: e-commerce-api
AI: ${GITHUB_BASE_PATH}/e-commerce-api에 프로젝트를 생성하시겠습니까? 
    (다른 경로를 원하시면 알려주세요)

사용자: 응
AI: [PowerShell 스크립트 실행]
    프로젝트가 생성되었습니다!
    
    다음 단계:
    1. cursor "${GITHUB_BASE_PATH}/e-commerce-api" 로 프로젝트를 열어주세요
    2. constitution.md를 검토하고 프로젝트에 맞게 수정하세요
    3. /speckit.specify로 첫 번째 기능 스펙을 작성하세요
```

## 주의사항

- 이미 존재하는 경로에 프로젝트를 생성하면 덮어쓰기 확인을 요청합니다
- Git이 설치되어 있지 않으면 Git 초기화 단계를 건너뜁니다
- 프로젝트 이름에 공백이나 특수문자는 피해주세요
