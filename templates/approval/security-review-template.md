# Security Review Template

## Submission Information
- **Submission ID:** _______________
- **Project Name:** _______________
- **Submitter:** _______________
- **Security Reviewer:** _______________
- **Review Date:** _______________
- **Review Deadline:** _______________

---

## Review Summary

### Overall Recommendation
☐ **APPROVE** - Meets security requirements  
☐ **CONDITIONAL APPROVAL** - Approve with specific security requirements  
☐ **REJECT** - Unacceptable security risks

### Security Risk Rating
☐ Low ☐ Medium ☐ High ☐ Critical

### Compliance Status
☐ Fully Compliant ☐ Conditionally Compliant ☐ Non-Compliant

---

## 1. Authentication and Access Control

### Authentication Mechanism
| Requirement | Implemented | Status | Comments |
|-------------|-------------|--------|----------|
| Multi-Factor Authentication (MFA) | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |
| Single Sign-On (SSO) | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |
| Password Complexity | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |
| Account Lockout | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |
| Session Management | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |

**Overall Authentication:** ☐ Pass ☐ Fail ☐ Conditional

**Comments:**

### Authorization Model
| Requirement | Implemented | Status | Comments |
|-------------|-------------|--------|----------|
| Role-Based Access Control (RBAC) | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |
| Least Privilege Principle | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |
| Separation of Duties | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |
| Access Reviews Planned | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |
| Privileged Access Management | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |

**Overall Authorization:** ☐ Pass ☐ Fail ☐ Conditional

**Comments:**

---

## 2. Data Protection

### Data Classification
**Highest Data Classification:** ☐ Public ☐ Internal ☐ Confidential ☐ Restricted

### Data Protection Measures
| Control | Required | Implemented | Status | Comments |
|---------|----------|-------------|--------|----------|
| **Encryption at Rest** | ☐ Yes ☐ No | ☐ Yes ☐ No | ☐ Pass ☐ Fail | Algorithm: _____ |
| **Encryption in Transit** | ☐ Yes ☐ No | ☐ Yes ☐ No | ☐ Pass ☐ Fail | TLS Version: _____ |
| **Data Masking** | ☐ Yes ☐ No | ☐ Yes ☐ No | ☐ Pass ☐ Fail ☐ N/A | |
| **Tokenization** | ☐ Yes ☐ No | ☐ Yes ☐ No | ☐ Pass ☐ Fail ☐ N/A | |
| **Data Loss Prevention** | ☐ Yes ☐ No | ☐ Yes ☐ No | ☐ Pass ☐ Fail ☐ N/A | |
| **Secure Key Management** | ☐ Yes ☐ No | ☐ Yes ☐ No | ☐ Pass ☐ Fail | |

**Overall Data Protection:** ☐ Pass ☐ Fail ☐ Conditional

### Sensitive Data Handling
☐ Contains PII (Personally Identifiable Information)  
☐ Contains PHI (Protected Health Information)  
☐ Contains Financial Data  
☐ Contains Classified Information  
☐ None of the above

**PII/PHI Controls Assessment:**
- [ ] Privacy Impact Assessment completed
- [ ] Data retention policy defined
- [ ] Data disposal procedures documented
- [ ] Consent management implemented (if required)
- [ ] Data subject rights supported (if required)

**Comments:**

---

## 3. Network Security

### Network Architecture
| Control | Implemented | Status | Comments |
|---------|-------------|--------|----------|
| Network Segmentation | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |
| DMZ Implementation | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |
| Firewall Rules | ☐ Yes ☐ No | ☐ Pass ☐ Fail ☐ Conditional | |
| IDS/IPS | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |
| VPN/Secure Remote Access | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |
| Web Application Firewall | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ Conditional | |

**Overall Network Security:** ☐ Pass ☐ Fail ☐ Conditional

**Comments:**

---

## 4. Application Security

### Secure Development
| Practice | Implemented | Status | Comments |
|----------|-------------|--------|----------|
| Security Requirements | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail | |
| Secure Coding Standards | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail | |
| Code Review Process | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail | |
| Static Code Analysis (SAST) | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail | |
| Dynamic Analysis (DAST) | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail | |
| Dependency Scanning | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail | |

### OWASP Top 10 Protection
| Vulnerability | Protected | Status | Comments |
|---------------|-----------|--------|----------|
| Injection | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail | |
| Broken Authentication | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail | |
| Sensitive Data Exposure | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail | |
| XML External Entities | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ N/A | |
| Broken Access Control | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail | |
| Security Misconfiguration | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail | |
| Cross-Site Scripting (XSS) | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ N/A | |
| Insecure Deserialization | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail ☐ N/A | |
| Using Components with Known Vulnerabilities | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail | |
| Insufficient Logging & Monitoring | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail | |

**Overall Application Security:** ☐ Pass ☐ Fail ☐ Conditional

**Comments:**

---

## 5. Compliance Requirements

### Regulatory Compliance
| Regulation | Applicable | Status | Comments |
|------------|-----------|--------|----------|
| **FedRAMP** | ☐ Yes ☐ No | ☐ Compliant ☐ Non-Compliant ☐ In Progress | Level: _____ |
| **FISMA** | ☐ Yes ☐ No | ☐ Compliant ☐ Non-Compliant ☐ In Progress | |
| **NIST 800-53** | ☐ Yes ☐ No | ☐ Compliant ☐ Non-Compliant ☐ In Progress | Baseline: _____ |
| **HIPAA** | ☐ Yes ☐ No | ☐ Compliant ☐ Non-Compliant ☐ In Progress | |
| **PCI-DSS** | ☐ Yes ☐ No | ☐ Compliant ☐ Non-Compliant ☐ In Progress | Level: _____ |
| **SOX** | ☐ Yes ☐ No | ☐ Compliant ☐ Non-Compliant ☐ In Progress | |
| **GDPR** | ☐ Yes ☐ No | ☐ Compliant ☐ Non-Compliant ☐ In Progress | |

### NIST 800-53 Control Families (if applicable)
| Family | Coverage | Assessment | Comments |
|--------|----------|------------|----------|
| AC - Access Control | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| AU - Audit and Accountability | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| AT - Awareness and Training | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| CM - Configuration Management | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| CP - Contingency Planning | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| IA - Identification and Authentication | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| IR - Incident Response | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| MA - Maintenance | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| MP - Media Protection | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| PE - Physical and Environmental Protection | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| PL - Planning | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| PS - Personnel Security | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| RA - Risk Assessment | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| CA - Security Assessment and Authorization | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| SC - System and Communications Protection | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| SI - System and Information Integrity | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |
| SA - System and Services Acquisition | ☐ Full ☐ Partial ☐ None | ☐ Pass ☐ Fail | |

**Overall Compliance:** ☐ Pass ☐ Fail ☐ Conditional

**Comments:**

---

## 6. Monitoring and Logging

### Logging Requirements
| Logging Type | Implemented | Status | Comments |
|--------------|-------------|--------|----------|
| Application Logs | ☐ Yes ☐ No | ☐ Pass ☐ Fail | |
| Security Logs | ☐ Yes ☐ No | ☐ Pass ☐ Fail | |
| Audit Logs | ☐ Yes ☐ No | ☐ Pass ☐ Fail | |
| Access Logs | ☐ Yes ☐ No | ☐ Pass ☐ Fail | |
| Error Logs | ☐ Yes ☐ No | ☐ Pass ☐ Fail | |
| Transaction Logs | ☐ Yes ☐ No ☐ N/A | ☐ Pass ☐ Fail | |

**Log Retention Period:** _____ days/months/years  
**Requirement Met:** ☐ Yes ☐ No

### Monitoring Capabilities
| Capability | Implemented | Status | Comments |
|------------|-------------|--------|----------|
| Real-time Monitoring | ☐ Yes ☐ No | ☐ Pass ☐ Fail ☐ N/A | |
| SIEM Integration | ☐ Yes ☐ No | ☐ Pass ☐ Fail ☐ N/A | |
| Alerting System | ☐ Yes ☐ No | ☐ Pass ☐ Fail | |
| Security Dashboard | ☐ Yes ☐ No | ☐ Pass ☐ Fail ☐ N/A | |
| Anomaly Detection | ☐ Yes ☐ No | ☐ Pass ☐ Fail ☐ N/A | |

**Overall Monitoring:** ☐ Pass ☐ Fail ☐ Conditional

**Comments:**

---

## 7. Incident Response

### Incident Response Plan
- [ ] Incident response plan documented
- [ ] Incident classification defined
- [ ] Response procedures documented
- [ ] Escalation procedures defined
- [ ] Communication plan established
- [ ] Recovery procedures documented

### Incident Response Capabilities
| Capability | Status | Comments |
|------------|--------|----------|
| Detection | ☐ Adequate ☐ Needs Improvement ☐ Inadequate | |
| Analysis | ☐ Adequate ☐ Needs Improvement ☐ Inadequate | |
| Containment | ☐ Adequate ☐ Needs Improvement ☐ Inadequate | |
| Eradication | ☐ Adequate ☐ Needs Improvement ☐ Inadequate | |
| Recovery | ☐ Adequate ☐ Needs Improvement ☐ Inadequate | |
| Post-Incident Review | ☐ Adequate ☐ Needs Improvement ☐ Inadequate | |

**Overall Incident Response:** ☐ Pass ☐ Fail ☐ Conditional

**Comments:**

---

## 8. Vulnerability Management

### Vulnerability Assessment
- [ ] Vulnerability scanning planned
- [ ] Scanning frequency defined (specify: _______)
- [ ] Remediation SLAs defined
- [ ] Patch management process documented

### Penetration Testing
**Penetration Testing Required:** ☐ Yes ☐ No ☐ Uncertain

**If Yes:**
- Testing Frequency: _____
- Testing Scope: _____
- Testing Type: ☐ External ☐ Internal ☐ Both
- Tester: ☐ Internal ☐ Third-party

### Third-party Security
| Vendor/Service | Security Assessment | Status | Comments |
|----------------|---------------------|--------|----------|
| | ☐ Completed ☐ Pending ☐ N/A | ☐ Pass ☐ Fail | |
| | ☐ Completed ☐ Pending ☐ N/A | ☐ Pass ☐ Fail | |

**Overall Vulnerability Management:** ☐ Pass ☐ Fail ☐ Conditional

**Comments:**

---

## 9. Security Testing

### Testing Requirements
| Test Type | Required | Planned | Status | Comments |
|-----------|----------|---------|--------|----------|
| **Unit Security Tests** | ☐ Yes ☐ No | ☐ Yes ☐ No | ☐ Pass ☐ Fail ☐ N/A | |
| **Integration Security Tests** | ☐ Yes ☐ No | ☐ Yes ☐ No | ☐ Pass ☐ Fail ☐ N/A | |
| **Security Acceptance Tests** | ☐ Yes ☐ No | ☐ Yes ☐ No | ☐ Pass ☐ Fail ☐ N/A | |
| **Vulnerability Scanning** | ☐ Yes ☐ No | ☐ Yes ☐ No | ☐ Pass ☐ Fail | |
| **Penetration Testing** | ☐ Yes ☐ No | ☐ Yes ☐ No | ☐ Pass ☐ Fail ☐ N/A | |
| **Security Code Review** | ☐ Yes ☐ No | ☐ Yes ☐ No | ☐ Pass ☐ Fail ☐ N/A | |

**Testing Schedule:** _____________________

**Overall Security Testing:** ☐ Pass ☐ Fail ☐ Conditional

**Comments:**

---

## 10. Security Risk Assessment

### Identified Security Risks
| Risk | Likelihood | Impact | Risk Level | Mitigation | Status |
|------|-----------|--------|------------|------------|--------|
| | ☐ H ☐ M ☐ L | ☐ H ☐ M ☐ L | ☐ Critical ☐ High ☐ Med ☐ Low | | ☐ Mitigated ☐ Accepted ☐ Pending |
| | ☐ H ☐ M ☐ L | ☐ H ☐ M ☐ L | ☐ Critical ☐ High ☐ Med ☐ Low | | ☐ Mitigated ☐ Accepted ☐ Pending |
| | ☐ H ☐ M ☐ L | ☐ H ☐ M ☐ L | ☐ Critical ☐ High ☐ Med ☐ Low | | ☐ Mitigated ☐ Accepted ☐ Pending |

### Risk Summary
**Critical Risks:** _____ (must be mitigated before approval)  
**High Risks:** _____ (mitigation plan required)  
**Medium Risks:** _____ (accepted or mitigated)  
**Low Risks:** _____ (accepted)

**Overall Security Risk:** ☐ Low ☐ Medium ☐ High ☐ Critical

**Unacceptable Risks (must address):**
1. 
2. 
3. 

---

## 11. Recommendations and Conditions

### Mandatory Security Requirements (if Conditional Approval)
1. 
2. 
3. 

**Verification:** ☐ Self-certified ☐ Requires security re-review ☐ Third-party assessment

### Recommended Security Enhancements
1. 
2. 
3. 

### Required Security Documentation
- [ ] Security architecture document
- [ ] Data flow diagrams with security boundaries
- [ ] Threat model
- [ ] Security test plan
- [ ] Incident response plan
- [ ] Privacy Impact Assessment (if applicable)
- [ ] Authority to Operate documentation (if applicable)

---

## 12. Review Summary

### Strengths
1. 
2. 
3. 

### Weaknesses
1. 
2. 
3. 

### Critical Concerns
1. 
2. 
3. 

### Security Posture Assessment
**Overall Security Maturity:** ☐ Advanced ☐ Mature ☐ Developing ☐ Initial

**Compliance Readiness:** ☐ Ready ☐ Nearly Ready ☐ Needs Work ☐ Not Ready

**Recommended Path:** ☐ Proceed ☐ Proceed with Conditions ☐ Remediate and Resubmit ☐ Reject

---

## 13. Reviewer Decision

### Final Recommendation
☐ **APPROVE** - Meets all security requirements  
☐ **CONDITIONAL APPROVAL** - Security conditions must be met  
☐ **REJECT** - Unacceptable security risks

### Justification
*Provide detailed security justification for your recommendation*

### Security Conditions (if Conditional Approval)
*List specific, measurable security conditions*

1. 
2. 
3. 

**Condition Verification Required By:** _____________________

### Authority to Operate (ATO) Recommendation
☐ Recommend ATO after conditions met  
☐ Recommend conditional ATO  
☐ Do not recommend ATO  
☐ ATO not applicable

---

## Security Reviewer Certification

**I certify that I have conducted a thorough security review and my assessment represents my professional security opinion.**

**Security Reviewer Name:** _______________________  
**Security Certifications:** _______________________  
**Signature:** _______________________  
**Date:** _______________________  
**Time Spent on Review:** _____ hours

---

## Secondary Security Review (if required)

**Secondary Reviewer Name:** _______________________  
**Concurrence:** ☐ Concur ☐ Concur with Comments ☐ Do Not Concur  
**Comments:**

**Signature:** _______________________  
**Date:** _______________________

---

## Security Officer Endorsement (for high-risk projects)

**Security Officer Name:** _______________________  
**Endorsement:** ☐ Endorsed ☐ Endorsed with Conditions ☐ Not Endorsed  
**Comments:**

**Signature:** _______________________  
**Date:** _______________________

---

## Contact Information

**Security Review Team:** security-review@agency.gov  
**Security Officer:** security-officer@agency.gov  
**Compliance Team:** compliance@agency.gov  
**ARB Help Desk:** arb-support@agency.gov
