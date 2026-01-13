# {{PROJECT_NAME}} 프로젝트 헌법

> 생성일: {{DATE}}  
> 기반: {{BASE_PATH}} (Spec-Kit v1.0)

## 프로젝트 개요

### 목적

[프로젝트의 주요 목적과 비즈니스 가치를 기술하세요]

### 범위

- **포함**: [프로젝트에 포함되는 기능/영역]
- **제외**: [프로젝트에서 제외되는 기능/영역]

### 이해관계자

| 역할 | 담당자 | 연락처 |
|------|--------|--------|
| 프로젝트 오너 | | |
| 개발 리드 | | |
| 디자이너 | | |

---

## 기술 스택

### 언어 및 런타임

- **주요 언어**: [예: TypeScript, Python, Go]
- **런타임**: [예: Node.js 20.x, Python 3.11]

### 프레임워크

- **백엔드**: [예: NestJS, FastAPI, Express]
- **프론트엔드**: [예: Next.js, React, Vue]

### 데이터베이스

- **주 DB**: [예: PostgreSQL, MongoDB]
- **캐시**: [예: Redis]

### 인프라

- **배포 환경**: [예: AWS, GCP, Azure, Vercel]
- **컨테이너**: [예: Docker, Kubernetes]
- **CI/CD**: [예: GitHub Actions, GitLab CI]

---

## 코딩 표준

### 네이밍 컨벤션

| 대상 | 규칙 | 예시 |
|------|------|------|
| 파일명 | `kebab-case` | `user-service.ts` |
| 클래스명 | `PascalCase` | `UserService` |
| 함수명 | `camelCase` | `getUserById` |
| 상수 | `UPPER_SNAKE_CASE` | `MAX_RETRY_COUNT` |
| 환경 변수 | `UPPER_SNAKE_CASE` | `DATABASE_URL` |

### 코드 스타일

- **포매터**: [예: Prettier, Black]
- **린터**: [예: ESLint, Ruff]
- **들여쓰기**: [예: 2 spaces, 4 spaces, tabs]
- **줄 길이**: [예: 100자]

### 주석 규칙

```
// 좋은 예: 왜(Why)를 설명
// 사용자 세션 만료 시 자동 로그아웃을 위해 30분으로 설정
const SESSION_TIMEOUT = 30 * 60 * 1000;

// 나쁜 예: 무엇(What)만 설명
// 타임아웃을 30분으로 설정
const SESSION_TIMEOUT = 30 * 60 * 1000;
```

---

## 디렉토리 구조

```
{{PROJECT_NAME}}/
├── .cursor/commands/       # Cursor IDE 커맨드
├── .specify/
│   ├── memory/             # AI 컨텍스트
│   ├── scripts/            # 자동화 스크립트
│   └── templates/          # 템플릿
├── docs/                   # 문서
├── specs/                  # 기능 명세서
├── src/                    # 소스 코드
│   ├── [domain]/           # 도메인별 모듈
│   └── shared/             # 공통 유틸리티
├── tests/                  # 테스트 코드
├── constitution.md         # 이 파일
└── README.md
```

---

## 테스트 전략

### 테스트 레벨

| 레벨 | 도구 | 커버리지 목표 |
|------|------|---------------|
| 단위 테스트 | [예: Jest, pytest] | 80% |
| 통합 테스트 | [예: Supertest] | 60% |
| E2E 테스트 | [예: Playwright, Cypress] | 핵심 시나리오 |

### 테스트 원칙

1. **새 기능**: 반드시 테스트 코드 포함
2. **버그 수정**: 재현 테스트 먼저 작성
3. **리팩토링**: 기존 테스트 통과 확인

---

## Spec-Kit 워크플로우

### 기능 개발 프로세스

```
1. /speckit.specify  → 스펙 작성 (요구사항 정의)
2. /speckit.plan     → 플랜 수립 (구현 전략)
3. /speckit.tasks    → 태스크 분해 (세부 작업)
4. /speckit.implement → 구현 (코드 작성)
```

### 브랜치 전략

| 타입 | 패턴 | 예시 |
|------|------|------|
| 기능 | `feature/SPEC-XXX-description` | `feature/SPEC-001-user-auth` |
| 버그 | `fix/SPEC-XXX-description` | `fix/SPEC-002-login-error` |
| 핫픽스 | `hotfix/description` | `hotfix/security-patch` |
| 릴리스 | `release/vX.Y.Z` | `release/v1.0.0` |

### 커밋 메시지 규칙

```
<type>(<scope>): <subject>

<body>

<footer>
```

**타입:**
- `feat`: 새 기능
- `fix`: 버그 수정
- `docs`: 문서
- `style`: 포맷팅
- `refactor`: 리팩토링
- `test`: 테스트
- `chore`: 빌드/설정

**예시:**
```
feat(auth): 소셜 로그인 구현

- Google OAuth 2.0 연동
- 사용자 프로필 동기화

Refs: SPEC-003
```

---

## 보안 가이드라인

### 필수 사항

- [ ] 환경 변수로 민감 정보 관리 (`.env`는 `.gitignore`에 포함)
- [ ] SQL Injection 방지 (Parameterized Query 사용)
- [ ] XSS 방지 (입력값 검증 및 이스케이프)
- [ ] HTTPS 강제
- [ ] 인증 토큰 안전하게 저장

### 금지 사항

- ❌ 코드에 시크릿 하드코딩
- ❌ 프로덕션 데이터로 테스트
- ❌ 디버그 로그에 민감 정보 출력

---

## API 설계 원칙

### RESTful 규칙

| 동작 | 메서드 | 경로 패턴 |
|------|--------|-----------|
| 목록 조회 | GET | `/resources` |
| 단일 조회 | GET | `/resources/{id}` |
| 생성 | POST | `/resources` |
| 전체 수정 | PUT | `/resources/{id}` |
| 부분 수정 | PATCH | `/resources/{id}` |
| 삭제 | DELETE | `/resources/{id}` |

### 응답 형식

```json
{
  "success": true,
  "data": { ... },
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 100
  }
}
```

### 에러 응답

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "입력값이 올바르지 않습니다",
    "details": [
      { "field": "email", "message": "유효한 이메일 형식이 아닙니다" }
    ]
  }
}
```

---

## 참조 문서

- **Spec-Kit 가이드**: `docs/spec-kit-guide.md`
- **베스트 프랙티스**: `docs/best-practices.md`
- **시작 가이드**: `docs/getting-started.md`
- **문제 해결**: `docs/troubleshooting.md`

---

## 변경 이력

| 날짜 | 버전 | 변경 내용 | 작성자 |
|------|------|----------|--------|
| {{DATE}} | 1.0.0 | 초기 버전 생성 | |
