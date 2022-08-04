Invariant: age-1
Description: """
  There SHALL be a code if there is a value and it SHALL be an expression of time.
  If system is present, it SHALL be UCUM. If value is present, it SHALL be positive.
"""
Expression: "(code.exists() or value.empty()) and (system.empty() or system = %ucum) and (value.empty() or value.hasValue().not() or value > 0)"
Severity: #error
