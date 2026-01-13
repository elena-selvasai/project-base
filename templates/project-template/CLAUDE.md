# Project Context

> 이 프로젝트는 Spec-Kit 방법론(명세 주도 개발)을 따릅니다.

## Spec-Kit 워크플로우

```
1. SPEC.md   → 무엇을 만들지 명세 작성
2. PLAN.md   → 어떻게 만들지 계획 수립
3. tasks.md  → 작업을 세분화하여 분류
4. 구현      → 계획에 따라 코드 작성
5. 검증      → 인수 조건 확인
```

## 사용 가능한 명령어

Cursor IDE와 Claude Code 모두 동일한 명령어를 사용합니다.

| 명령어 | 설명 |
|--------|------|
| `/speckit.specify [기능 설명]` | 새 기능의 SPEC.md 생성 |
| `/speckit.clarify` | 명세서의 불명확한 부분 명확화 |
| `/speckit.plan` | SPEC.md에 대한 PLAN.md 생성 |
| `/speckit.tasks` | PLAN.md에서 tasks.md 생성 |
| `/speckit.implement` | 작업 구현 |
| `/speckit.analyze` | 일관성 분석 |
| `/speckit.checklist [도메인]` | 요구사항 품질 체크리스트 생성 |
| `/speckit.constitution` | 프로젝트 헌법 관리 |
| `/speckit.init` | 새 프로젝트 초기화 |
| `/speckit.taskstoissues` | tasks를 GitHub Issues로 변환 |

## 핵심 원칙

### Spec-Driven Development (SDD)
- 모든 기능은 명세서(SPEC.md)로 시작
- 구현 전 명세서와 계획(PLAN.md) 작성 및 검토
- AI 에이전트는 명세서를 기반으로 코드 생성

### Documentation First
- 코드는 자체 문서화
- 복잡한 로직은 주석으로 설명

### Test-Driven Development (TDD)
- 테스트 가능한 코드 작성
- 새 기능은 테스트와 함께 작성

## 코딩 표준

- 파일명: kebab-case (예: user-service.js)
- 변수/함수: camelCase (예: getUserById)
- 클래스: PascalCase (예: UserController)
- 상수: UPPER_SNAKE_CASE (예: MAX_RETRY_COUNT)

## 중요 파일

- constitution.md - 프로젝트 헌법 (코딩 표준, 아키텍처 지침)
- specs/ - 기능 명세서 디렉토리

## 디버깅 원칙

- 원인 분석이 되지 않거나 반복적으로 수정을 시도하는 경우 작업 즉시 중단
- 현재까지 파악된 상황, 시도한 방법, 해결되지 않는 원인을 정리하여 사용자에게 보고
