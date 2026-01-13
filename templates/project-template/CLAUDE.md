# Project Context for Claude Code

> 이 프로젝트는 Spec-Kit 방법론(명세 주도 개발)을 따릅니다.

## Spec-Kit 워크플로우

1. **SPEC.md** - 무엇을 만들지 명세 작성
2. **PLAN.md** - 어떻게 만들지 계획 수립
3. **tasks.md** - 작업을 세분화하여 분류
4. **구현** - 계획에 따라 코드 작성
5. **검증** - 인수 조건 확인

## 핵심 원칙

### Spec-Driven Development (SDD)
- 모든 기능은 명세서(SPEC.md)로 시작합니다
- 구현 전 명세서와 계획(PLAN.md)을 작성하고 검토합니다
- AI 에이전트는 명세서를 기반으로 코드를 생성합니다

### Documentation First
- 코드는 자체 문서화되어야 합니다
- 복잡한 로직은 주석으로 설명합니다

### Test-Driven Development (TDD)
- 테스트 가능한 코드를 작성합니다
- 새 기능은 테스트와 함께 작성됩니다

## 코딩 표준

- **파일명**: `kebab-case` (예: `user-service.js`)
- **변수/함수**: `camelCase` (예: `getUserById`)
- **클래스**: `PascalCase` (예: `UserController`)
- **상수**: `UPPER_SNAKE_CASE` (예: `MAX_RETRY_COUNT`)

## 커스텀 명령어

이 프로젝트에서 사용 가능한 슬래시 명령어:

- `/spec [기능 설명]` - 새 기능의 SPEC.md 생성
- `/plan [spec 경로]` - SPEC.md에 대한 PLAN.md 생성
- `/tasks [plan 경로]` - PLAN.md에서 tasks.md 생성
- `/implement [작업 설명]` - 특정 작업 구현

## 중요 파일

- `constitution.md` - 프로젝트 헌법 (코딩 표준, 아키텍처 지침)
- `specs/` - 기능 명세서들이 위치하는 디렉토리
- `templates/` - SPEC, PLAN 템플릿 파일들

## 디버깅 원칙

- 디버깅 과정에서 원인 분석이 되지 않거나 반복적으로 수정을 시도하는 경우, 작업을 즉시 중단합니다
- 현재까지 파악된 상황, 시도한 방법, 해결되지 않는 원인을 정리하여 사용자에게 보고합니다
