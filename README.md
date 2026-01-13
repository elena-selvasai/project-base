# Spec-Kit Base

Spec-Driven Development를 위한 중앙 템플릿 저장소입니다.

## 개요

이 저장소는 Spec-Kit 방법론을 위한 통합 템플릿을 제공합니다.

### 주요 기능

- **Cursor IDE 커맨드**: `/speckit.xxx` 형식의 워크플로우 커맨드
- **PowerShell 자동화**: 브랜치 생성, 스펙 파일 초기화 등 자동화 스크립트
- **통합 템플릿**: 스펙, 플랜, 태스크, 헌법 템플릿
- **상세 가이드**: 방법론 가이드 및 베스트 프랙티스 문서

## 빠른 시작

### 신규 프로젝트 생성

```powershell
# 기본 사용
D:\project\base\.specify\scripts\powershell\init-project.ps1 -ProjectName "my-app"

# 다른 경로에 생성
D:\project\base\.specify\scripts\powershell\init-project.ps1 -ProjectName "my-app" -TargetPath "C:\workspace"

# 샘플 스펙 포함
D:\project\base\.specify\scripts\powershell\init-project.ps1 -ProjectName "my-app" -IncludeSampleSpec

# Git 초기화 건너뛰기
D:\project\base\.specify\scripts\powershell\init-project.ps1 -ProjectName "my-app" -SkipGit
```

### 생성되는 프로젝트 구조

```
my-app/
├── .cursor/commands/       # Cursor IDE 커맨드
├── .specify/
│   ├── memory/             # AI 컨텍스트
│   ├── scripts/powershell/ # 자동화 스크립트
│   └── templates/          # 템플릿
├── docs/                   # 가이드 문서
├── specs/                  # 기능 명세서
├── constitution.md         # 프로젝트 헌법
└── .gitignore
```

## 디렉토리 구조

```
D:\project\base\
├── .cursor/
│   └── commands/               # Cursor IDE 커맨드
│       ├── speckit.analyze.md
│       ├── speckit.checklist.md
│       ├── speckit.clarify.md
│       ├── speckit.constitution.md
│       ├── speckit.implement.md
│       ├── speckit.init.md         # 프로젝트 초기화
│       ├── speckit.plan.md
│       ├── speckit.specify.md
│       ├── speckit.tasks.md
│       └── speckit.taskstoissues.md
│
├── .specify/
│   ├── memory/
│   │   └── constitution.md     # AI 컨텍스트 헌법
│   ├── scripts/
│   │   └── powershell/
│   │       ├── check-prerequisites.ps1
│   │       ├── common.ps1
│   │       ├── create-new-feature.ps1
│   │       ├── init-project.ps1    # 프로젝트 초기화 스크립트
│   │       ├── setup-plan.ps1
│   │       └── update-agent-context.ps1
│   └── templates/
│       ├── agent-file-template.md
│       ├── checklist-template.md
│       ├── plan-template.md
│       ├── project-constitution-template.md
│       ├── spec-template.md
│       └── tasks-template.md
│
├── docs/
│   ├── best-practices.md       # 베스트 프랙티스
│   ├── getting-started.md      # 시작 가이드
│   ├── spec-kit-guide.md       # 상세 방법론 가이드
│   └── troubleshooting.md      # 문제 해결
│
├── templates/                  # 프로젝트 템플릿
│   ├── constitution-template.md
│   ├── plan-template.md
│   ├── project-template/
│   └── spec-template.md
│
├── constitution.md             # 워크스페이스 헌법
├── .editorconfig
├── .gitignore
└── README.md                   # 이 파일
```

## Spec-Kit 워크플로우

### 1. 스펙 작성 (`/speckit.specify`)

기능 요구사항을 명세서로 작성합니다.

```
사용자 스토리, 수용 기준, 기술 요구사항 정의
→ specs/SPEC-XXX-feature-name.md 생성
```

### 2. 플랜 수립 (`/speckit.plan`)

스펙을 기반으로 구현 전략을 수립합니다.

```
아키텍처 결정, 의존성 분석, 리스크 식별
→ specs/SPEC-XXX-feature-name.plan.md 생성
```

### 3. 태스크 분해 (`/speckit.tasks`)

플랜을 구체적인 작업 단위로 분해합니다.

```
세부 태스크, 추정 시간, 우선순위 정의
→ specs/SPEC-XXX-feature-name.tasks.md 생성
```

### 4. 구현 (`/speckit.implement`)

태스크를 순서대로 구현합니다.

```
코드 작성, 테스트, 문서화
→ 기능 구현 완료
```

## Cursor 커맨드 목록

| 커맨드 | 설명 |
|--------|------|
| `/speckit.init` | 신규 프로젝트 초기화 |
| `/speckit.specify` | 스펙 작성 |
| `/speckit.plan` | 플랜 수립 |
| `/speckit.tasks` | 태스크 분해 |
| `/speckit.implement` | 구현 실행 |
| `/speckit.analyze` | 스펙 분석 |
| `/speckit.checklist` | 체크리스트 생성 |
| `/speckit.clarify` | 명확화 요청 |
| `/speckit.constitution` | 헌법 관리 |
| `/speckit.taskstoissues` | 태스크를 이슈로 변환 |

## PowerShell 스크립트

| 스크립트 | 설명 |
|----------|------|
| `init-project.ps1` | 신규 프로젝트 생성 |
| `create-new-feature.ps1` | 기능 브랜치 및 스펙 파일 생성 |
| `setup-plan.ps1` | 플랜 파일 셋업 |
| `check-prerequisites.ps1` | 필수 문서 검증 |
| `update-agent-context.ps1` | AI 컨텍스트 업데이트 |

## 문서

- **[Spec-Kit 가이드](docs/spec-kit-guide.md)**: 상세한 방법론 가이드
- **[베스트 프랙티스](docs/best-practices.md)**: 권장 사례 모음
- **[시작 가이드](docs/getting-started.md)**: 처음 시작하는 분을 위한 가이드
- **[문제 해결](docs/troubleshooting.md)**: 자주 묻는 질문과 해결책

## 커스터마이징

### 템플릿 수정

`.specify/templates/` 폴더의 템플릿을 프로젝트 요구사항에 맞게 수정하세요.

### 커맨드 확장

`.cursor/commands/`에 새로운 커맨드를 추가하거나 기존 커맨드를 수정할 수 있습니다.

### 스크립트 확장

`.specify/scripts/powershell/`에 프로젝트 특화 스크립트를 추가할 수 있습니다.

## 라이선스

MIT License

---

**Spec-Kit** - Spec-Driven Development를 위한 통합 도구 모음
