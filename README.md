# Spec-Kit Base

Spec-Driven Development를 위한 중앙 템플릿 저장소입니다.

## 개요

이 저장소는 Spec-Kit 방법론을 위한 통합 템플릿을 제공합니다.

### 주요 기능

- **Cursor IDE 커맨드**: `/speckit.xxx` 형식의 워크플로우 커맨드
- **Claude Code 커맨드**: Cursor와 동일한 `/speckit.xxx` 커맨드 지원
- **PowerShell 자동화**: 브랜치 생성, 스펙 파일 초기화 등 자동화 스크립트
- **통합 템플릿**: 스펙, 플랜, 태스크, 헌법 템플릿
- **상세 가이드**: 방법론 가이드 및 베스트 프랙티스 문서

## 빠른 시작

### 신규 프로젝트 생성

```powershell
# 기본 사용
D:\project\base\.specify\scripts\powershell\init-project.ps1 -ProjectName "my-app"

# 다른 경로에 생성 또는 옵션 확인
D:\project\base\.specify\scripts\powershell\init-project.ps1 -ProjectName "my-app" -TargetPath "C:\workspace"
```

## 디렉토리 구조

```
D:\project\base\
├── .specify/
│   ├── memory/
│   │   └── constitution.md     # AI 컨텍스트 헌법
│   ├── scripts/
│   │   └── powershell/
│   │       ├── check-prerequisites.ps1
│   │       ├── common.ps1
│   │       ├── create-new-feature.ps1
│   │       ├── init-project.ps1
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
├── templates/
│   ├── plan-template.md
│   ├── project-template/       # 프로젝트 템플릿
│   │   ├── .cursor/commands/   # Cursor 커맨드
│   │   ├── .claude/commands/   # Claude Code 커맨드
│   │   ├── CLAUDE.md           # Claude Code 컨텍스트
│   │   ├── constitution.md
│   │   └── README.md
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
→ specs/[feature-name]/SPEC.md 생성
```

### 2. 명확화 (`/speckit.clarify`)

스펙의 불명확한 부분을 명확화합니다.

```
모호한 요구사항 식별, 질문 및 답변
→ SPEC.md 업데이트
```

### 3. 플랜 수립 (`/speckit.plan`)

스펙을 기반으로 구현 전략을 수립합니다.

```
아키텍처 결정, 의존성 분석, 리스크 식별
→ specs/[feature-name]/PLAN.md 생성
```

### 4. 태스크 분해 (`/speckit.tasks`)

플랜을 구체적인 작업 단위로 분해합니다.

```
세부 태스크, 추정 시간, 우선순위 정의
→ specs/[feature-name]/tasks.md 생성
```

### 5. 구현 (`/speckit.implement`)

태스크를 순서대로 구현합니다.

```
코드 작성, 테스트, 문서화
→ 기능 구현 완료
```

## 커맨드 목록

Cursor IDE와 Claude Code 모두 동일한 `/speckit.xxx` 형식의 커맨드를 지원합니다.

**주요 커맨드**: specify (스펙 작성) → clarify (명확화) → plan (플랜 수립) → tasks (태스크 분해) → implement (구현)

전체 커맨드 목록과 상세 사용법은 [Spec-Kit 가이드](docs/spec-kit-guide.md)를 참조하세요.

## 지원 도구

### Cursor IDE
- `templates/project-template/.cursor/commands/` 커맨드가 새 프로젝트에 복사됨
- 슬래시 명령어로 워크플로우 실행

### Claude Code
- `templates/project-template/.claude/commands/` 커맨드가 새 프로젝트에 복사됨
- `CLAUDE.md` 파일로 프로젝트 컨텍스트 제공
- Cursor와 동일한 명령어 체계

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

`templates/project-template/.cursor/commands/` 또는 `templates/project-template/.claude/commands/`에 새로운 커맨드를 추가하거나 기존 커맨드를 수정할 수 있습니다.

### 스크립트 확장

`.specify/scripts/powershell/`에 프로젝트 특화 스크립트를 추가할 수 있습니다.

## 라이선스

MIT License

---

**Spec-Kit** - Spec-Driven Development를 위한 통합 도구 모음
