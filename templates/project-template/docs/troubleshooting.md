# Troubleshooting Guide

Common issues and solutions when working with Spec-Kit methodology.

## Project Setup Issues

### Issue: Directory structure not correct

**Error**:
```
Required directories missing: specs/, src/, tests/
```

**Cause**: Spec-Kit standard structure is not set up.

**Solution**:
```bash
# Navigate to project root
cd your-project

# Create required directories
mkdir -p src tests specs docs
```

### Issue: Project directory already exists

**Error**:
```
Directory 'my-project' already exists
```

**Cause**: A project with that name already exists.

**Solutions**:
1. **Use a different name**:
   ```bash
   mkdir my-project-v2
   ```

2. **Delete existing project**:
   ```bash
   rm -rf my-project
   ```

3. **Rename existing project**:
   ```bash
   mv my-project my-project-old
   ```

## Validation Issues

### Issue: Validation fails with missing directories

**Error**:
```
[WARN] src/ directory is missing (recommended)
[WARN] tests/ directory is missing (recommended)
```

**Cause**: Standard directories haven't been created yet.

**Solution**:
```bash
cd your-project
mkdir -p src tests specs docs
```

### Issue: README contains placeholder text

**Warning**:
```
[WARN] README.md contains placeholder text
```

**Cause**: Template placeholders haven't been replaced.

**Solution**:
Edit `README.md` and replace:
- `[Project Name]` → Your actual project name
- `[project-name]` → Your project identifier
- `[Description]` → Actual description
- `[Date]` → Current date

## Git Issues

### Issue: Git not initialized

**Info**:
```
[INFO] Git repository not initialized
```

**Solution**:
```bash
cd your-project
git init
git add .
git commit -m "feat: initialize project"
```

### Issue: Git initialization fails

**Cause**: Git not installed or not in PATH.

**Solution**:
1. **Check Git installation**:
   ```bash
   git --version
   ```

2. **Install Git** (if not installed):
   - Download from [git-scm.com](https://git-scm.com)
   - Or use package manager:
     ```bash
     # macOS
     brew install git
     
     # Ubuntu/Debian
     sudo apt install git
     
     # Windows (chocolatey)
     choco install git
     ```

## Spec-Kit Workflow Issues

### Issue: SPEC.md is too vague for AI

**Problem**: AI generates generic or incorrect code.

**Cause**: Specification lacks detail.

**Solution**:
Add more specificity:

❌ **Too vague**:
```markdown
## Requirements
- User authentication
```

✅ **Better**:
```markdown
## Requirements
### FR1: Email/Password Authentication
- Users provide email and password
- Password hashed with bcrypt (cost factor: 12)
- JWT token returned on success (expires in 24h)
- Invalid credentials return 401 with error message

### FR2: Session Management
- Tokens stored in httpOnly cookies
- Refresh token mechanism for seamless renewal
- Logout invalidates token on server
```

### Issue: AI doesn't follow constitution

**Problem**: Generated code violates coding standards.

**Cause**: AI wasn't explicitly told to follow constitution.

**Solution**:
Always include constitution in prompts:

```
Implement user authentication following:
- Spec: specs/auth/SPEC.md
- Plan: specs/auth/PLAN.md
- Constitution: constitution.md

Ensure the code follows all naming conventions,
error handling patterns, and security guidelines
defined in the constitution.
```

### Issue: Implementation deviates from plan

**Problem**: Code doesn't match PLAN.md.

**Cause**: Implementation discovered issues with the plan.

**Solution**:
1. **Update PLAN.md** to reflect reality
2. **Document changes**:
   ```markdown
   ## Deviations from Original Plan
   
   ### Change 1: Database Schema
   **Original**: Single `users` table
   **Actual**: Split into `users` and `user_profiles`
   **Reason**: Separation of authentication data from profile data
   improves security and allows different access patterns
   ```

## Testing Issues

### Issue: Tests are failing

**Error**:
```
FAIL: 5/10 tests failing
```

**Debugging Steps**:

1. **Check test output**:
   ```bash
   npm test -- --verbose
   # or
   pytest -v
   ```

2. **Run specific test**:
   ```bash
   npm test -- --testNamePattern="should add item to cart"
   # or
   pytest -k "test_add_item_to_cart"
   ```

3. **Check acceptance criteria**:
   - Do tests match SPEC.md?
   - Are requirements correctly understood?

4. **Review implementation**:
   - Does code follow PLAN.md?
   - Are there logic errors?

5. **Check test setup**:
   - Are mocks configured correctly?
   - Is test data valid?

### Issue: Low test coverage

**Problem**: Coverage below target (e.g., <70%).

**Solution**:

1. **Identify uncovered code**:
   ```bash
   npm run test:coverage
   # or
   pytest --cov=src --cov-report=html
   ```

2. **Add missing tests**:
   - Edge cases
   - Error scenarios
   - Boundary conditions

3. **Check if code is testable**:
   - Extract dependencies
   - Use dependency injection
   - Reduce coupling

### Issue: Tests are slow

**Problem**: Test suite takes too long.

**Solutions**:

1. **Run tests in parallel**:
   ```javascript
   // jest.config.js
   module.exports = {
     maxWorkers: "50%"
   };
   ```

2. **Use test categories**:
   ```bash
   npm run test:unit     # Fast unit tests
   npm run test:integration  # Slower integration tests
   ```

3. **Mock expensive operations**:
   - Database calls
   - External APIs
   - File I/O

## AI Assistant Issues

### Issue: AI generates code that doesn't compile

**Cause**: AI lacks full context or makes assumptions.

**Solution**:

1. **Provide complete context**:
   ```
   I'm working in a TypeScript project.
   TypeScript version: 5.0
   Strict mode: enabled
   
   Generate code for...
   ```

2. **Share error messages**:
   ```
   The generated code has this error:
   [paste error]
   
   Please fix it.
   ```

3. **Request incremental changes**:
   ```
   Instead of generating the entire file,
   just show me the function signature first.
   ```

### Issue: AI suggests insecure code

**Example**: SQL queries with string concatenation.

**Solution**:

1. **Point to constitution**:
   ```
   The code you generated has SQL injection vulnerability.
   Please review the security guidelines in constitution.md
   and use parameterized queries instead.
   ```

2. **Provide secure example**:
   ```
   Here's how we handle database queries in this project:
   
   // Secure pattern from existing code
   const result = await db.query(
     'SELECT * FROM users WHERE id = $1',
     [userId]
   );
   
   Please follow this pattern.
   ```

### Issue: AI forgets previous context

**Problem**: In long conversations, AI forgets earlier instructions.

**Solution**:

1. **Re-establish context**:
   ```
   Reminder: We're implementing specs/cart/SPEC.md
   following constitution.md standards.
   ```

2. **Break into smaller chunks**:
   - Complete one component at a time
   - Start fresh conversation for new components

3. **Use clear references**:
   ```
   Continue from the CartService implementation
   we just completed. Now implement CartController
   following the same patterns.
   ```

### Issue: AI stuck in debugging loop

**Problem**: AI assistant is stuck in a loop of repetitive fixes or cannot identify the root cause.

**Rule**: During the process of debugging and fixing errors, if the cause analysis is not working or if repeat fixes are happening, **stop and notify the user about the situation immediately.**

### Issue: Execution error after development

**Problem**: Errors occur during execution verification after completing development.

**Rule**: Development is only considered complete after verifying that basic execution is normal. If an execution error occurs, try to fix it. If the fix is difficult or if repeated errors occur, **stop and notify the user about the situation immediately.**

## Dependency Issues

### Issue: npm install fails

**Solutions**:

1. **Clear npm cache**:
   ```bash
   npm cache clean --force
   rm -rf node_modules
   rm package-lock.json
   npm install
   ```

2. **Check Node version**:
   ```bash
   node --version
   # Ensure it matches project requirements
   ```

3. **Use exact versions**:
   ```json
   {
     "dependencies": {
       "express": "4.18.2"
     }
   }
   ```

### Issue: Dependency conflicts

**Error**:
```
npm ERR! ERESOLVE unable to resolve dependency tree
```

**Solutions**:

1. **Use --legacy-peer-deps**:
   ```bash
   npm install --legacy-peer-deps
   ```

2. **Update package.json**:
   ```json
   {
     "overrides": {
       "problematic-package": "compatible-version"
     }
   }
   ```

3. **Check constitution**:
   - Are there approved versions list?
   - Has this dependency been vetted?

## Structure Validation Errors

### Issue: Multiple warnings from validation

**Output**:
```
[WARN] specs/ directory is missing
[WARN] docs/ directory is missing
[ERROR] README.md is missing
```

**Solution - Quick Fix**:
```bash
# Navigate to project
cd your-project

# Create missing directories
mkdir -p specs docs

# Create README if missing
touch README.md

# Create constitution if missing
touch constitution.md
```

## Documentation Issues

### Issue: Links in markdown files are broken

**Problem**: File paths in markdown don't work.

**Cause**: Using relative paths incorrectly.

**Solution**:

Use relative paths for project files:
```markdown
[constitution](./constitution.md)
[SPEC](./specs/feature-name/SPEC.md)
[best practices](./docs/best-practices.md)
```

### Issue: Mermaid diagrams don't render

**Cause**: Syntax errors in diagram.

**Solution**:

1. **Validate syntax** at [mermaid.live](https://mermaid.live)

2. **Quote labels** with special characters:
   ```mermaid
   graph LR
       A["User (authenticated)"] --> B["API"]
   ```

3. **Avoid HTML** in labels

## Getting More Help

### Resources

- **Constitution**: [constitution.md](../constitution.md)
- **Getting Started**: [getting-started.md](./getting-started.md)
- **Spec-Kit Guide**: [spec-kit-guide.md](./spec-kit-guide.md)
- **Best Practices**: [best-practices.md](./best-practices.md)

### Asking for Help

When requesting help, provide:

1. **Context**:
   - What were you trying to do?
   - What command did you run?

2. **Error details**:
   - Full error message
   - Stack trace (if applicable)

3. **Environment**:
   - OS (Windows/macOS/Linux)
   - Language/framework versions
   - Git version

4. **What you've tried**:
   - Solutions attempted
   - Results of each attempt

**Example**:
```
I'm trying to set up a new project but getting an error.

Command:
mkdir -p src tests specs docs

Error:
Permission denied

Environment:
- OS: Ubuntu 22.04
- Node: 18.17.0

What I tried:
1. Verified I'm in project root - YES
2. Checked write permissions - NO (found the issue here)

Any ideas?
```

---

**Still stuck?** Ask your AI coding assistant for help with specific errors!
