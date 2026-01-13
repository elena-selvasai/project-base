# Spec-Kit Workspace Constitution

> 이 문서는 Spec-Kit 방법론을 사용하는 모든 프로젝트에 적용되는 불변 원칙과 가이드라인을 정의합니다.
> 각 프로젝트는 자체 `constitution.md`를 가질 수 있으며, 이 글로벌 원칙을 확장하거나 구체화할 수 있습니다.

## Core Principles

### 1. Spec-Driven Development (SDD)
- 모든 기능은 명세서(SPEC.md)로 시작합니다
- 구현 전 명세서와 계획(PLAN.md)을 작성하고 검토합니다
- AI 에이전트는 명세서를 기반으로 코드를 생성합니다

### 2. Documentation First
- 코드는 자체 문서화되어야 합니다
- 복잡한 로직은 주석으로 설명합니다
- README, 가이드, 아키텍처 문서는 항상 최신 상태를 유지합니다

### 3. Test-Driven Development (TDD)
- 테스트 가능한 코드를 작성합니다
- 새 기능은 테스트와 함께 작성됩니다
- 회귀 버그 방지를 위해 테스트 커버리지를 유지합니다

### 4. Iterative & Incremental
- 작은 단위로 자주 커밋합니다
- 기능은 점진적으로 개발하고 배포합니다
- 피드백을 빠르게 수집하고 반영합니다.

### 5. Debugging Loop Prevention
- 디버깅 과정에서 원인 분석이 되지 않거나 반복적으로 수정을 시도하는 경우, 작업을 즉시 중단합니다.
- 현재까지 파악된 상황, 시도한 방법, 해결되지 않는 원인을 정리하여 사용자에게 보고하고 가이드를 요청합니다.

### 6. Execution Verification and Error Handling
- 개발 완료 후에는 반드시 프로그램을 실행하여 기본 동작이 정상적으로 이루어지는지 확인해야 합니다.
- 실행 과정에서 오류가 발생할 경우 우선적으로 수정을 시도하며, 수정이 어렵거나 반복적으로 오류가 발생한다면 즉시 중단하고 사용자에게 상황을 알립니다.

## Coding Standards

### General Guidelines
- **가독성**: 명확하고 이해하기 쉬운 코드를 작성합니다
- **일관성**: 프로젝트 내에서 일관된 스타일을 유지합니다
- **간결성**: 불필요한 복잡성을 피합니다 (KISS - Keep It Simple, Stupid)
- **중복 제거**: DRY (Don't Repeat Yourself) 원칙을 따릅니다

### Naming Conventions
- **파일명**: `kebab-case` 사용 (예: `user-service.js`)
- **변수/함수**: `camelCase` 사용 (예: `getUserById`)
- **클래스**: `PascalCase` 사용 (예: `UserController`)
- **상수**: `UPPER_SNAKE_CASE` 사용 (예: `MAX_RETRY_COUNT`)
- **의미 있는 이름**: 변수와 함수 이름은 목적을 명확히 전달해야 합니다

### Code Structure
```
- 함수는 단일 책임 원칙(SRP)을 따릅니다
- 함수는 가능한 짧고 집중되어야 합니다 (이상적으로 20줄 이하)
- 깊은 중첩(nesting)을 피합니다 (최대 3단계)
- Early return을 활용하여 중첩을 줄입니다
```

### Comments
```javascript
// Good: 왜(Why)를 설명하는 주석
// 캐시를 사용하여 반복적인 API 호출을 방지
const cachedData = cache.get(key);

// Bad: 무엇(What)을 반복하는 주석
// 변수 x에 5를 할당
const x = 5;
```

## Testing Strategy

### Test Pyramid
1. **Unit Tests** (70%): 개별 함수/모듈 테스트
2. **Integration Tests** (20%): 컴포넌트 간 상호작용 테스트
3. **E2E Tests** (10%): 전체 사용자 플로우 테스트

### Test Guidelines
- 테스트 이름은 테스트 내용을 명확히 설명해야 합니다
- AAA 패턴 사용: Arrange, Act, Assert
- 독립적이고 반복 가능한 테스트 작성
- 테스트는 빠르게 실행되어야 합니다
- Mock/Stub은 필요한 경우에만 사용합니다

### Test Coverage
- 최소 70% 코드 커버리지 목표
- 핵심 비즈니스 로직은 90% 이상
- CI/CD 파이프라인에서 테스트 자동 실행

## Git & Version Control

### Branching Strategy
```
main (production-ready)
  └── develop (integration)
      └── feature/[feature-name] (new features)
      └── fix/[bug-name] (bug fixes)
      └── docs/[doc-name] (documentation)
```

### Commit Messages
```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: 새 기능
- `fix`: 버그 수정
- `docs`: 문서 변경
- `style`: 코드 포맷팅 (기능 변경 없음)
- `refactor`: 리팩토링
- `test`: 테스트 추가/수정
- `chore`: 빌드/설정 변경

**Example:**
```
feat(auth): add JWT token refresh mechanism

Implement automatic token refresh before expiration
to improve user experience and reduce login frequency.

Closes #123
```

## Architecture Guidelines

### Design Principles
- **Separation of Concerns**: 관심사 분리
- **Dependency Injection**: 의존성 주입으로 결합도 감소
- **Single Source of Truth**: 데이터의 단일 진실 공급원
- **Interface Segregation**: 클라이언트별 인터페이스 분리

### Project Structure
```
project/
  ├── src/              # 소스 코드
  │   ├── controllers/  # 요청 처리
  │   ├── services/     # 비즈니스 로직
  │   ├── models/       # 데이터 모델
  │   ├── utils/        # 유틸리티
  │   └── config/       # 설정
  ├── tests/            # 테스트
  ├── docs/             # 문서
  └── specs/            # 기능 명세서
```

### Error Handling
- 모든 에러는 적절히 처리되어야 합니다
- 사용자 친화적인 에러 메시지 제공
- 에러 로깅으로 디버깅 지원
- 예외는 구체적으로 catch합니다

## Security

### Data Protection
- 민감 정보는 환경 변수로 관리 (.env)
- 비밀번호, API 키는 절대 코드에 하드코딩하지 않습니다
- .gitignore에 민감 파일 추가

### Input Validation
- 모든 사용자 입력은 검증합니다
- SQL Injection, XSS 공격 방지
- 파일 업로드 검증 (타입, 크기)

### Authentication & Authorization
- 최소 권한 원칙(Principle of Least Privilege)
- 세션/토큰 만료 시간 설정
- HTTPS 사용 권장

## Performance

### Optimization Guidelines
- 불필요한 계산 피하기
- 데이터베이스 쿼리 최적화 (N+1 문제 방지)
- 캐싱 전략 활용
- 리소스는 사용 후 정리

### Monitoring
- 성능 메트릭 수집
- 로그 레벨 적절히 설정 (dev: debug, prod: info+)
- 에러 모니터링 도구 활용

## Documentation Standards

### README.md Requirements
모든 프로젝트는 다음을 포함하는 README.md를 가져야 합니다:
- 프로젝트 개요 및 목적
- 설치 및 실행 방법
- 의존성 및 요구사항
- 사용 예제
- 프로젝트 구조
- 기여 가이드라인

### Code Documentation
- Public API는 JSDoc/Docstring 형식으로 문서화
- 복잡한 알고리즘은 주석으로 설명
- TODO/FIXME 주석은 이슈 트래커와 연동

## Review & Approval

### Code Review
- 모든 코드는 리뷰를 거쳐야 합니다
- 리뷰어는 코드 품질, 테스트, 문서를 확인합니다
- 건설적인 피드백을 제공합니다

### Spec Review
- SPEC.md, PLAN.md는 구현 전 승인 필요
- 아키텍처 변경은 팀 논의 필요

## Continuous Improvement

### Retrospectives
- 프로젝트 마일스톤마다 회고
- 무엇이 잘 되었고, 무엇을 개선할 수 있는지 논의
- 액션 아이템 도출 및 추적

### Learning & Sharing
- 새로운 기술/패턴 학습 권장
- 지식 공유 세션 (Tech Talk)
- 문서화를 통한 지식 보존

---

**Last Updated**: 2026-01-12
**Version**: 1.3.0
