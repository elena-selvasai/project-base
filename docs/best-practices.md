# 모범 사례

Spec-Kit 방법론을 사용할 때의 모범 사례입니다.

> **참고**: 코딩 표준, 아키텍처 원칙 등의 이론적 내용은 [constitution.md](../constitution.md)를 참조하세요. 이 문서는 실제 예제와 사용 패턴에 집중합니다.

## 명세서 작성

### 명확한 사용자 스토리

✅ **좋은 예**:
```markdown
고객으로서
장바구니에 상품을 저장하고 싶습니다
나중에 구매할 수 있도록
```

❌ **나쁜 예**:
```markdown
장바구니 기능
```

### 구체적인 인수 조건

✅ **좋은 예**:
```markdown
- [ ] 사용자는 장바구니에 최대 100개 상품 추가 가능
- [ ] 로그인한 사용자의 장바구니는 30일간 유지
- [ ] 장바구니에 실시간 가격 업데이트 표시
- [ ] 품절 시 사용자에게 오류 메시지 표시
```

❌ **나쁜 예**:
```markdown
- [ ] 장바구니 작동
- [ ] 상품 추가 가능
```

### 완전한 요구사항

✅ **좋은 예**:
```markdown
## 성능 요구사항
- API 응답 시간 < 200ms (p95)
- 1000명 동시 사용자 지원
- 데이터베이스 쿼리 평균 < 50ms

## 보안 요구사항
- 모든 입력값 검증 및 정제
- SQL 인젝션 방지
- 속도 제한: 사용자당 100 요청/분
```

❌ **나쁜 예**:
```markdown
## 요구사항
- 빠르게
- 안전하게
```

## 계획 수립

### 컴포넌트 구성

✅ **좋은 예**:
```markdown
### 컴포넌트 1: 데이터 레이어
목적: 데이터베이스 작업 처리

#### src/models/cart.js (신규)
- CartModel.create()
- CartModel.findByUser()
- CartModel.addItem()

#### src/repositories/cart-repository.js (신규)
- CartModel 추상화
- 캐싱 로직

---

### 컴포넌트 2: 비즈니스 로직
목적: 장바구니 비즈니스 규칙

#### src/services/cart-service.js (신규)
- 상품 가용성 검증
- 합계 계산
- 할인 적용
```

❌ **나쁜 예**:
```markdown
### 생성할 파일
- cart.js
- cart-service.js
- cart-controller.js
```

### 작업 추정

✅ **좋은 예**:
```markdown
## 1단계: 데이터 레이어 (4시간)
1. [ ] Cart 모델 생성 (1시간)
2. [ ] 캐싱 포함 CartRepository 추가 (2시간)
3. [ ] 리포지토리 단위 테스트 (1시간)
```

❌ **나쁜 예**:
```markdown
## 1단계
- 데이터베이스 작업
```

## 구현

### 커밋 메시지

✅ **좋은 예**:
```
feat(cart): 장바구니에 상품 추가 기능 구현

CartService.addItem() 메서드 구현:
- 재고 검증
- 수량 제한 (최대 100개)
- 가격 계산

관련 명세: specs/shopping-cart/SPEC.md

Closes #42
```

❌ **나쁜 예**:
```
파일 업데이트
```

### 코드 주석

✅ **좋은 예**:
```javascript
// 사용자 등급과 상품 수량에 따른 할인 계산
// 비즈니스 규칙: 골드 등급은 $100 이상 주문 시 15% 할인
// 전체 규칙은 specs/discounts/SPEC.md 참조
function calculateDiscount(user, cart) {
  // ...
}
```

❌ **나쁜 예**:
```javascript
// 할인 계산
function calculateDiscount(user, cart) {
  // ...
}
```

### 오류 처리

✅ **좋은 예**:
```javascript
async function addItemToCart(userId, itemId, quantity) {
  // 입력값 검증
  if (!userId || !itemId || quantity < 1) {
    throw new ValidationError('유효하지 않은 입력 매개변수');
  }
  
  // 상품 가용성 확인
  const item = await itemRepository.findById(itemId);
  if (!item) {
    throw new NotFoundError(`상품 ${itemId}을(를) 찾을 수 없음`);
  }
  
  if (item.stock < quantity) {
    throw new OutOfStockError(`${item.stock}개만 구매 가능`);
  }
  
  // 장바구니에 추가
  try {
    return await cartRepository.addItem(userId, itemId, quantity);
  } catch (error) {
    logger.error('장바구니에 상품 추가 실패', { userId, itemId, error });
    throw new DatabaseError('장바구니 업데이트 실패');
  }
}
```

❌ **나쁜 예**:
```javascript
async function addItemToCart(userId, itemId, quantity) {
  const item = await itemRepository.findById(itemId);
  return await cartRepository.addItem(userId, itemId, quantity);
}
```

## 테스트

### 설명적인 테스트 이름

✅ **좋은 예**:
```javascript
describe('CartService.addItem', () => {
  it('재고가 있을 때 장바구니에 상품을 추가해야 함', async () => {
    // ...
  });
  
  it('수량이 재고를 초과할 때 OutOfStockError를 던져야 함', async () => {
    // ...
  });
  
  it('수량이 음수일 때 ValidationError를 던져야 함', async () => {
    // ...
  });
  
  it('상품 추가 후 장바구니 합계를 업데이트해야 함', async () => {
    // ...
  });
});
```

❌ **나쁜 예**:
```javascript
describe('CartService', () => {
  it('작동함', () => {
    // ...
  });
  
  it('테스트 2', () => {
    // ...
  });
});
```

### AAA 패턴

✅ **좋은 예**:
```javascript
it('골드 등급 사용자의 할인을 계산해야 함', () => {
  // Arrange (준비)
  const user = { tier: 'gold', id: '123' };
  const cart = { total: 150, items: [...] };
  const service = new DiscountService();
  
  // Act (실행)
  const discount = service.calculate(user, cart);
  
  // Assert (검증)
  expect(discount).toBe(22.50); // $150의 15%
});
```

❌ **나쁜 예**:
```javascript
it('할인 계산', () => {
  expect(new DiscountService().calculate(
    { tier: 'gold' },
    { total: 150 }
  )).toBe(22.50);
});
```

### 테스트 커버리지

✅ **좋은 예**:
```javascript
describe('CartService', () => {
  describe('addItem', () => {
    it('유효한 요청을 처리해야 함');
    it('상품 존재 여부를 검증해야 함');
    it('재고 가용성을 확인해야 함');
    it('수량 제한을 적용해야 함');
    it('데이터베이스 오류를 처리해야 함');
    it('장바구니 합계를 업데이트해야 함');
    it('장바구니 업데이트 이벤트를 발행해야 함');
  });
});
```

❌ **나쁜 예**:
```javascript
describe('CartService', () => {
  it('상품 추가');
});
```

## 문서화

### README 구조

✅ **좋은 예**:
```markdown
# 장바구니 서비스

장바구니 관리를 위한 API 서비스.

## 기능
- 상품 추가/제거
- 할인 적용 합계 계산
- 장바구니 영속성
- 실시간 가격 업데이트

## 설치
\`\`\`bash
npm install
npm run migrate
\`\`\`

## 설정
- `DB_URL`: 데이터베이스 연결 문자열
- `CACHE_TTL`: 캐시 지속 시간 (기본값: 300초)

## API 문서
[docs/api.md](docs/api.md) 참조

## 아키텍처
[docs/architecture.md](docs/architecture.md) 참조
```

❌ **나쁜 예**:
```markdown
# 프로젝트

이것은 프로젝트입니다.

## 설정
실행하세요.
```

### API 문서

✅ **좋은 예**:
```markdown
### POST /api/cart/items

사용자의 장바구니에 상품을 추가합니다.

**인증**: 필수 (JWT)

**요청**:
\`\`\`json
{
  "itemId": "item_123",
  "quantity": 2
}
\`\`\`

**응답** (200):
\`\`\`json
{
  "cartId": "cart_456",
  "items": [...],
  "total": 49.99
}
\`\`\`

**오류**:
- 400: 유효하지 않은 입력
- 404: 상품을 찾을 수 없음
- 409: 품절
- 401: 인증되지 않음
```

❌ **나쁜 예**:
```markdown
### POST /cart

상품 추가.
```

## Git 워크플로우

### 브랜치 명명

✅ **좋은 예**:
```
feature/shopping-cart
fix/cart-total-calculation
docs/api-documentation
refactor/cart-service
```

❌ **나쁜 예**:
```
my-branch
updates
john-branch
```

### 풀 리퀘스트

✅ **좋은 예**:
```markdown
## 기능: 장바구니

**명세**: specs/shopping-cart/SPEC.md
**계획**: specs/shopping-cart/PLAN.md

### 요약
사용자가 상품을 추가/제거하고, 장바구니 내용을 보고,
결제를 진행할 수 있는 장바구니 기능 구현.

### 변경 사항
- CartModel, CartService, CartController 추가
- Redis 캐싱과 함께 장바구니 영속성 구현
- 장바구니 작업을 위한 REST API 엔드포인트 생성
- 종합 테스트 스위트 추가 (87% 커버리지)

### 테스트
- [x] 단위 테스트 (42개 테스트 통과)
- [x] 통합 테스트 (8개 시나리오)
- [x] 수동 테스트 완료
- [x] 성능 테스트 (< 150ms p95)

### 스크린샷
![Cart API](./screenshots/cart-api.png)

### 체크리스트
- [x] constitution.md 준수
- [x] 모든 인수 조건 충족
- [x] 문서 업데이트 완료
- [x] 린팅 오류 없음
```

❌ **나쁜 예**:
```markdown
장바구니 관련 추가
```

## AI와 작업하기

### 맥락이 풍부한 프롬프트

✅ **좋은 예**:
```
장바구니 기능을 구현하고 있습니다.

컨텍스트:
- 명세: specs/shopping-cart/SPEC.md
- 계획: specs/shopping-cart/PLAN.md
- 헌법: constitution.md

작업: PLAN.md 섹션 2.3의 설계에 따라 CartService.addItem() 
메서드를 구현하세요. OrderService.createOrder()와 동일한 
오류 처리 패턴을 사용하세요.

검증 포함:
- 상품 존재 여부
- 재고 가용성
- 수량 제한 (1-100)

업데이트된 장바구니와 재계산된 합계를 반환하세요.
```

❌ **나쁜 예**:
```
장바구니 서비스 만들어줘
```

### 반복적 개선

✅ **좋은 예**:
```
1차 프롬프트:
"CartService 초기 구현 생성"

2차 프롬프트:
"품절 시나리오에 대한 오류 처리 추가"

3차 프롬프트:
"테스트 용이성 개선을 위해 리팩토링 - 
재고 확인을 별도 메서드로 추출"

4차 프롬프트:
"모든 엣지 케이스를 커버하는 종합 단위 테스트 추가"
```

❌ **나쁜 예**:
```
"완벽하게 만들어줘"
```

## 코드 품질

### DRY 원칙

✅ **좋은 예**:
```javascript
// 재사용 가능한 검증
class Validator {
  static validatePositiveInteger(value, name) {
    if (!Number.isInteger(value) || value < 1) {
      throw new ValidationError(`${name}은(는) 양의 정수여야 합니다`);
    }
  }
}

// 사용법
Validator.validatePositiveInteger(quantity, 'quantity');
Validator.validatePositiveInteger(userId, 'userId');
```

❌ **나쁜 예**:
```javascript
if (!Number.isInteger(quantity) || quantity < 1) {
  throw new Error('quantity는 양의 정수여야 합니다');
}

if (!Number.isInteger(userId) || userId < 1) {
  throw new Error('userId는 양의 정수여야 합니다');
}
```

### 단일 책임 원칙

✅ **좋은 예**:
```javascript
class CartService {
  addItem() { /* 장바구니 로직만 */ }
}

class PriceCalculator {
  calculate() { /* 가격 로직만 */ }
}

class InventoryService {
  checkStock() { /* 재고 로직만 */ }
}
```

❌ **나쁜 예**:
```javascript
class CartService {
  addItem() {
    // 장바구니 로직
    // 가격 로직
    // 재고 로직
    // 이메일 로직
    // 분석 로직
  }
}
```

## 보안

### 입력 검증

✅ **좋은 예**:
```javascript
const schema = Joi.object({
  itemId: Joi.string().uuid().required(),
  quantity: Joi.number().integer().min(1).max(100).required()
});

const { error, value } = schema.validate(req.body);
if (error) {
  return res.status(400).json({ error: error.details[0].message });
}
```

❌ **나쁜 예**:
```javascript
const { itemId, quantity } = req.body;
// 검증 없이 직접 사용
```

### 시크릿 관리

✅ **좋은 예**:
```javascript
// .env 파일 (gitignore에 추가)
DB_PASSWORD=secret123
API_KEY=key456

// 코드
const dbPassword = process.env.DB_PASSWORD;
```

❌ **나쁜 예**:
```javascript
const dbPassword = 'secret123'; // 하드코딩!
```

---

**기억하세요**: 이것은 지침이지 엄격한 규칙이 아닙니다. 상황에 따라 판단하세요.
