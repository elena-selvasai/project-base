# Spec-Kit 시작하기

Spec-Kit 방법론에 오신 것을 환영합니다! 이 가이드는 명세 주도 개발(Spec-Driven Development) 방법론과 프로젝트 구조를 시작하는 데 도움을 드립니다.

## Spec-Kit이란?

Spec-Kit은 다음을 위해 설계된 개발 방법론입니다:
- 일관된 구조로 프로젝트 관리
- 명세 주도 개발(Spec-Driven Development) 방법론 적용
- AI 어시스턴트를 활용한 효율적인 개발
- 표준을 통한 높은 코드 품질 유지

**특징**: IDE나 특정 도구에 종속되지 않는 범용 방법론으로, 어떤 개발 환경에서도 적용할 수 있습니다.

## 빠른 시작

### 1. 프로젝트 구조 탐색

```bash
# 프로젝트로 이동
cd your-project

# 구조 확인
tree  # 또는 ls -la
```

**권장 디렉토리 구조**:
- `src/` - 소스 코드
- `tests/` - 테스트 코드
- `specs/` - 기능 명세
- `docs/` - 문서
- `templates/` - 템플릿 (선택)

### 2. 헌법(Constitution) 읽기

프로젝트 루트의 `constitution.md`를 읽으세요:

```bash
cat constitution.md
# 또는 편집기로 열기
```

여기에 정의된 내용:
- 코딩 표준
- 테스트 전략
- Git 워크플로우
- 아키텍처 원칙

### 3. 프로젝트 구조 설정

새 프로젝트에 Spec-Kit 구조 적용:

```bash
# 필수 디렉토리 생성
mkdir -p src tests specs docs

# 헌법 파일 생성 (또는 템플릿에서 복사)
touch constitution.md

# README 생성
touch README.md
```

### 4. 기술 스택 설정

프로젝트 유형에 따라:

**Node.js/JavaScript**:
```bash
npm init -y
npm install --save-dev jest eslint prettier
```

**Python**:
```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
# 또는 .\venv\Scripts\Activate.ps1  # Windows
pip install pytest pylint black
```

**Java**:
```bash
# Maven 또는 Gradle 사용
mvn archetype:generate
# 또는
gradle init
```

### 5. 첫 번째 기능 명세 생성

```bash
# 1. 기능 디렉토리 생성
mkdir -p specs/initial-setup

# 2. 명세 파일 생성
touch specs/initial-setup/SPEC.md

# 3. SPEC.md에 기능 세부 사항 작성
```

### 6. AI 어시스턴트와 작업

AI 코딩 어시스턴트에게 요청하세요:

```
specs/initial-setup/SPEC.md의 새 기능을 작업 중입니다.
이 명세를 기반으로 구현 계획(PLAN.md)을 생성해 주세요.
```

AI가 수행할 작업:
1. SPEC.md 읽기
2. constitution.md 확인
3. 상세한 PLAN.md 생성
4. 작업 분류(tasks.md) 생성

### 7. 구현

```
specs/initial-setup/tasks.md의 작업 1을 구현하세요.
PLAN.md의 계획을 따르고 constitution.md를 준수하세요.
```

### 8. 테스트

테스트 작성 및 검증:

```bash
npm test  # 또는 적절한 테스트 명령
npm run lint
```

### 9. 검증

프로젝트 구조와 코드 품질 확인:
- 모든 테스트 통과 여부
- 린팅 오류 없음
- 문서 최신화 여부

## Spec-Kit 방법론 이해하기

Spec-Kit은 **명세 주도 개발(SDD)**을 기반으로 합니다:

### 흐름

```
아이디어 → SPEC.md → PLAN.md → tasks.md → 코드 → 테스트 → 리뷰 → 병합
```

### 핵심 문서

1. **SPEC.md** - 무엇과 왜
   - 사용자 스토리
   - 요구사항
   - 인수 조건

2. **PLAN.md** - 어떻게
   - 아키텍처
   - 컴포넌트
   - 구현 단계

3. **tasks.md** - 체크리스트
   - 세분화된 작업
   - 진행 상황 추적

4. **constitution.md** - 규칙
   - 코딩 표준
   - 테스트 요구사항
   - 아키텍처 원칙

### 이점

✅ **명확성**: 모든 사람이 무엇을 구축하는지 알고 있음  
✅ **AI 친화적**: AI가 명세에서 코드를 생성할 수 있음  
✅ **검토 가능**: 코딩 전에 설계 승인  
✅ **추적 가능**: 결정 사항의 명확한 문서화  
✅ **품질**: 헌법에 의해 강제되는 표준  
✅ **도구 독립적**: 어떤 IDE, 에디터, AI 도구와도 호환  

## 프로젝트 구조

### 권장 구조

모든 프로젝트는 동일한 구조를 따릅니다:
```
project/
  ├── constitution.md    # 프로젝트 규칙과 표준
  ├── README.md          # 프로젝트 소개
  ├── src/               # 소스 코드
  ├── tests/             # 테스트 코드
  ├── specs/             # 기능 명세
  │   └── feature-name/
  │       ├── SPEC.md    # 기능 명세
  │       ├── PLAN.md    # 구현 계획
  │       └── tasks.md   # 작업 목록
  └── docs/              # 추가 문서
```

### 템플릿 (선택)

재사용 가능한 템플릿 구성:
- `spec-template.md` - 기능 명세 템플릿
- `plan-template.md` - 구현 계획 템플릿
- `constitution-template.md` - 헌법 템플릿

## 성공을 위한 팁

### 📝 항상 명세부터 시작

코딩에 바로 뛰어들지 마세요! 먼저 명세를 작성하세요:
```markdown
# 사용자 인증

## 사용자 스토리
사용자로서, 안전하게 로그인하고 싶습니다,
내 계정에 접근할 수 있도록.

## 요구사항
- 이메일/비밀번호 인증
- JWT 토큰
- 비밀번호 해싱
```

### 🤖 AI를 효과적으로 활용

AI에게 명확한 컨텍스트를 제공하세요:
```
프로젝트: my-api
명세: specs/auth/SPEC.md
헌법: constitution.md

PLAN.md의 계획에 따라 JWT 인증을 구현하세요.
```

### ✅ 테스트 주도 개발

먼저 테스트를 작성하세요:
1. 실패하는 테스트 작성
2. 코드 구현
3. 테스트 통과
4. 리팩토링

### 📚 진행하면서 문서화

문서화를 나중으로 미루지 마세요:
- 기능 추가 시 README 업데이트
- 복잡한 코드에 주석 추가
- 변경 사항과 함께 API 문서 업데이트

### 🔍 병합 전 리뷰

항상 코드 리뷰를 받으세요:
- SPEC.md와 비교 확인
- 헌법 준수 확인
- 테스트 통과 확인
- 문서 검토

## 일반적인 워크플로우

### 일일 개발

```bash
# 1. 최신 변경 사항 가져오기
git pull

# 2. 기능 브랜치 생성
git checkout -b feature/new-feature

# 3. 명세 작성
# specs/new-feature/SPEC.md 편집

# 4. AI에게 계획 생성 요청
# (AI 어시스턴트를 통해)

# 5. 점진적으로 구현
# (작업별로)

# 6. 지속적으로 테스트
npm test  # 또는 해당 테스트 명령

# 7. 자주 커밋
git add .
git commit -m "feat: 사용자 로그인 구현"

# 8. 푸시하고 PR 생성
git push origin feature/new-feature
```

### 새 프로젝트에 Spec-Kit 적용

```bash
# 1. 프로젝트 디렉토리 생성
mkdir my-service && cd my-service

# 2. 기본 구조 설정
mkdir -p src tests specs docs

# 3. 기술 스택 설정
npm init -y  # 또는 해당 언어/프레임워크 초기화

# 4. 헌법 작성
# constitution.md에 프로젝트 규칙 정의

# 5. 초기 명세 작성
mkdir specs/project-setup
# specs/project-setup/SPEC.md 작성

# 6. Git 초기화
git init
git add .
git commit -m "feat: 프로젝트 초기화"
```

## 다음 단계

1. **Spec-Kit 가이드 읽기**: [spec-kit-guide.md](./spec-kit-guide.md)
2. **모범 사례 검토**: [best-practices.md](./best-practices.md)
3. **테스트 프로젝트 생성**: 간단한 "hello world" 프로젝트 만들어 보기
4. **헌법 작성**: 프로젝트에 맞는 constitution.md 작성

## 도움 받기

- **문제 해결**: [troubleshooting.md](./troubleshooting.md) 참조
- **헌법 예시**: [constitution.md](../constitution.md) 참조
- **AI 어시스턴트**: 코딩 어시스턴트에게 도움 요청!

---

**Spec-Kit과 함께 즐거운 코딩하세요! 🚀**
