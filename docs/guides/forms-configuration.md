# Microsoft Forms Configuration Guide

## Overview
This guide provides templates and configuration instructions for Microsoft Forms used in the ARB process.

## Prerequisites
- Microsoft Forms license (included in Microsoft 365)
- Forms Pro for advanced features (optional)
- SharePoint integration enabled
- Power Automate access for form responses

---

## Form 1: ARB Intake Form

### Form Settings
- **Form Name:** ARB Architecture Review Request
- **Description:** Complete this form to submit a new architecture review request
- **Accept Responses:** Yes
- **Response Receipts:** Enabled
- **One Response Per Person:** Yes
- **Response Notification:** To submitter and ARB gatekeepers

### Sections and Questions

#### Section 1: Basic Information

**Q1: Project Name** (Required)
- Type: Text (Short answer)
- Placeholder: "Enter the project or initiative name"

**Q2: Business Unit** (Required)
- Type: Choice (Dropdown)
- Options:
  - IT Infrastructure
  - Application Development
  - Data Services
  - Security
  - Cloud Services
  - Enterprise Architecture
  - Operations
  - Other

**Q3: Project Type** (Required)
- Type: Choice (Dropdown)
- Options:
  - Infrastructure
  - Application
  - Data
  - Security
  - Cloud
  - Integration
  - Network
  - Other

**Q4: Priority** (Required)
- Type: Choice (Dropdown)
- Options:
  - Critical - Immediate business impact
  - High - Significant business value
  - Medium - Important but not urgent
  - Low - Nice to have

**Q5: Submitter Email**
- Type: Text (Short answer)
- Validation: Email format
- Default: User's email

**Q6: Business Sponsor Name** (Required)
- Type: Text (Short answer)

**Q7: Business Sponsor Email** (Required)
- Type: Text (Short answer)
- Validation: Email format

---

#### Section 2: Project Overview

**Q8: Executive Summary** (Required)
- Type: Text (Long answer)
- Subtitle: "Provide a brief overview of the project (200-500 words)"
- Minimum characters: 200

**Q9: Business Justification** (Required)
- Type: Text (Long answer)
- Subtitle: "Explain why this project is needed and how it aligns with strategic objectives"
- Minimum characters: 100

**Q10: Expected Benefits** (Required)
- Type: Text (Long answer)
- Subtitle: "List 3-5 key benefits this project will deliver"
- Placeholder: "1. Benefit one\n2. Benefit two\n3. Benefit three"

**Q11: Success Criteria** (Required)
- Type: Text (Long answer)
- Subtitle: "Define measurable outcomes that will determine project success"
- Placeholder: "1. Criterion one\n2. Criterion two"

---

#### Section 3: Technical Details

**Q12: Current State** (Required)
- Type: Text (Long answer)
- Subtitle: "Describe the existing architecture/infrastructure/application"

**Q13: Proposed Architecture** (Required)
- Type: Text (Long answer)
- Subtitle: "Describe the target architecture including systems, integrations, and infrastructure"

**Q14: Technology Stack** (Required)
- Type: Text (Long answer)
- Subtitle: "List key technologies (OS, platform, database, languages, etc.)"
- Placeholder: "Operating System:\nPlatform/Framework:\nDatabase:\nProgramming Languages:"

**Q15: Uses Standard Enterprise Technology Stack?**
- Type: Choice (Single select)
- Options:
  - Yes - Uses all standard technologies
  - Partial - Some non-standard components
  - No - Requires new/different technologies
- Branching: If "Partial" or "No" → Show Q16

**Q16: Justification for Non-Standard Technologies** (Conditional)
- Type: Text (Long answer)
- Subtitle: "Explain why non-standard technologies are needed"

---

#### Section 4: Integration and Data

**Q17: System Integrations**
- Type: Text (Long answer)
- Subtitle: "List systems that will integrate with this solution"
- Placeholder: "System Name | Integration Method | Data Exchanged"

**Q18: Data Classification** (Required)
- Type: Choice (Single select)
- Options:
  - Public
  - Internal Use Only
  - Confidential
  - Restricted

**Q19: Contains Sensitive Data?** (Required)
- Type: Choice (Multiple select)
- Options:
  - PII (Personally Identifiable Information)
  - PHI (Protected Health Information)
  - Financial Data
  - Classified Information
  - None of the above

**Q20: Data Volume Estimate**
- Type: Text (Short answer)
- Subtitle: "Estimated initial data volume (GB/TB)"

**Q21: Daily Transaction Volume**
- Type: Text (Short answer)
- Subtitle: "Estimated transactions per day"

---

#### Section 5: Security and Compliance

**Q22: Authentication Method** (Required)
- Type: Choice (Multiple select)
- Options:
  - Single Sign-On (SSO)
  - Multi-Factor Authentication (MFA)
  - Certificate-based
  - API Keys
  - Other

**Q23: Encryption Requirements** (Required)
- Type: Choice (Multiple select)
- Options:
  - Encryption at Rest
  - Encryption in Transit (TLS)
  - Data Masking
  - Tokenization
  - Not Required

**Q24: Compliance Requirements** (Required)
- Type: Choice (Multiple select)
- Options:
  - FedRAMP
  - FISMA
  - NIST 800-53
  - HIPAA
  - PCI-DSS
  - SOX
  - GDPR
  - None

**Q25: Security Assessment Completed?**
- Type: Choice (Single select)
- Options:
  - Yes - Assessment attached
  - In Progress
  - Not Started
  - Not Required

**Q26: Privacy Impact Assessment (PIA) Required?**
- Type: Choice (Single select)
- Options:
  - Yes
  - No
  - Uncertain

---

#### Section 6: Performance and Scalability

**Q27: Expected Response Time Requirement**
- Type: Text (Short answer)
- Subtitle: "Target response time (milliseconds or seconds)"

**Q28: Expected Concurrent Users**
- Type: Text (Short answer)
- Subtitle: "Maximum number of concurrent users"

**Q29: Target Availability** (Required)
- Type: Choice (Single select)
- Options:
  - 99.9% (8.76 hours downtime/year)
  - 99.95% (4.38 hours downtime/year)
  - 99.99% (52.6 minutes downtime/year)
  - 99.999% (5.26 minutes downtime/year)
  - Other

**Q30: Scalability Approach**
- Type: Choice (Multiple select)
- Options:
  - Vertical Scaling (scale up)
  - Horizontal Scaling (scale out)
  - Auto-scaling
  - Load Balancing
  - Not Applicable

---

#### Section 7: Cost and Timeline

**Q31: Estimated Total Cost** (Required)
- Type: Text (Short answer)
- Subtitle: "Total project cost estimate (USD)"
- Placeholder: "$"

**Q32: Capital Expenses (CapEx)**
- Type: Text (Short answer)
- Subtitle: "One-time capital expenses"

**Q33: Operating Expenses (OpEx) - Annual**
- Type: Text (Short answer)
- Subtitle: "Annual operating expenses"

**Q34: Proposed Start Date** (Required)
- Type: Date
- Subtitle: "When do you plan to start this project?"

**Q35: Proposed End Date** (Required)
- Type: Date
- Subtitle: "Expected project completion date"

**Q36: Project Duration**
- Type: Choice (Single select)
- Options:
  - Less than 3 months
  - 3-6 months
  - 6-12 months
  - More than 12 months

---

#### Section 8: Risk Assessment

**Q37: Technical Risks Identified?** (Required)
- Type: Choice (Single select)
- Options:
  - Yes
  - No
  - Uncertain
- Branching: If "Yes" → Show Q38

**Q38: Technical Risks Description** (Conditional)
- Type: Text (Long answer)
- Subtitle: "Describe technical risks and mitigation strategies"

**Q39: Overall Risk Level** (Required)
- Type: Choice (Single select)
- Options:
  - Low - Well-understood technology and approach
  - Medium - Some unknowns but manageable
  - High - Significant challenges expected
  - Critical - Major risks to success

**Q40: Dependencies** (Required)
- Type: Text (Long answer)
- Subtitle: "List critical dependencies (other projects, vendors, systems)"

---

#### Section 9: Documentation

**Q41: Architecture Diagram Attached?** (Required)
- Type: Choice (Single select)
- Options:
  - Yes
  - No - Will provide later
  - Not Applicable
- Branching: If "Yes" → Show file upload

**Q42: Upload Architecture Diagram** (Conditional)
- Type: File Upload
- Allowed types: .pdf, .png, .jpg, .vsdx, .pptx
- Max size: 50 MB

**Q43: Technical Specification Attached?**
- Type: Choice (Single select)
- Options:
  - Yes
  - No - Will provide later
  - Not Applicable
- Branching: If "Yes" → Show file upload

**Q44: Upload Technical Specification** (Conditional)
- Type: File Upload
- Allowed types: .pdf, .docx, .pptx
- Max size: 50 MB

**Q45: Cost-Benefit Analysis Attached?**
- Type: Choice (Single select)
- Options:
  - Yes
  - No - Will provide later
  - Not Applicable
- Branching: If "Yes" → Show file upload

**Q46: Upload Cost-Benefit Analysis** (Conditional)
- Type: File Upload
- Allowed types: .pdf, .xlsx, .docx
- Max size: 25 MB

**Q47: Additional Documentation**
- Type: File Upload
- Subtitle: "Upload any additional supporting documents"
- Allowed types: All
- Max size: 100 MB
- Max files: 5

---

#### Section 10: Additional Information

**Q48: Special Considerations**
- Type: Text (Long answer)
- Subtitle: "Any other information the ARB should know?"
- Required: No

**Q49: Preferred Review Timeline**
- Type: Choice (Single select)
- Options:
  - Standard (27 business days)
  - Expedited (15 business days) - Requires justification
  - Emergency (7 business days) - Requires executive approval
- Branching: If "Expedited" or "Emergency" → Show Q50

**Q50: Justification for Expedited Review** (Conditional)
- Type: Text (Long answer)
- Subtitle: "Explain why expedited review is needed"

**Q51: I certify that the information provided is accurate** (Required)
- Type: Choice (Single select)
- Options:
  - Yes, I certify
- Required: Yes

---

### Form Logic and Branching

```
IF Q15 = "Partial" OR "No"
  THEN Show Q16

IF Q38 = "Yes"
  THEN Show Q39

IF Q41 = "Yes"
  THEN Show Q42

IF Q43 = "Yes"
  THEN Show Q44

IF Q45 = "Yes"
  THEN Show Q46

IF Q49 = "Expedited" OR "Emergency"
  THEN Show Q50
```

### Form Theming
- **Theme Color:** #0078d4 (Microsoft Blue)
- **Background Image:** Agency logo watermark
- **Header:** "Architecture Review Board - Submission Form"

---

## Form 2: Technical Review Questionnaire

### Form Settings
- **Form Name:** ARB Technical Review Assessment
- **Description:** Technical review checklist for ARB submissions
- **Restricted:** Only technical reviewers can access

### Key Questions

**Q1: Submission ID** (Required)
- Type: Text
- Validation: Pattern ARB-YYYY-NNN

**Q2: Reviewer Name** (Required)
- Type: Text
- Default: Current user

**Q3: Architecture Alignment** (Required)
- Type: Rating (5-point scale)
- Labels: Poor, Fair, Good, Very Good, Excellent

**Q4-Q20:** [Similar technical assessment questions following the technical review template]

---

## Form 3: Security Review Questionnaire

### Form Settings
- **Form Name:** ARB Security Review Assessment
- **Description:** Security assessment checklist for ARB submissions
- **Restricted:** Only security reviewers can access

### Key Questions

**Q1: Submission ID** (Required)
- Type: Text

**Q2: Security Reviewer Name** (Required)
- Type: Text

**Q3: Authentication Assessment** (Required)
- Type: Choice
- Options: Pass, Fail, Conditional

**Q4-Q25:** [Security assessment questions following the security review template]

---

## Power Automate Integration

### Form Response Flow

```json
{
  "trigger": "When a new response is submitted",
  "formId": "ARB Intake Form",
  "actions": [
    "Generate Submission ID",
    "Create item in SharePoint",
    "Upload attachments to document library",
    "Trigger ARB-001-Intake-Notification flow",
    "Send confirmation email"
  ]
}
```

### Submission ID Generation Formula
```
ARB-{YEAR}-{SequentialNumber:000}
Example: ARB-2024-001
```

---

## Form Deployment

### Step 1: Create Forms
1. Go to https://forms.microsoft.com
2. Create new form
3. Add sections and questions as specified above
4. Configure branching logic
5. Set form settings

### Step 2: Configure Permissions
1. Set form to require sign-in
2. Limit to organization members
3. Configure response notifications

### Step 3: Integrate with SharePoint
1. Create Power Automate flow
2. Map form fields to SharePoint columns
3. Handle file uploads to document library

### Step 4: Test
1. Submit test responses
2. Verify SharePoint integration
3. Check email notifications
4. Validate file uploads

---

## Form Embedding

### Embed in SharePoint Page
```html
<iframe 
  width="100%" 
  height="1200px" 
  src="https://forms.office.com/Pages/ResponsePage.aspx?id=FORM_ID" 
  frameborder="0" 
  marginwidth="0" 
  marginheight="0" 
  style="border: none; max-width:100%; max-height:100vh" 
  allowfullscreen 
  webkitallowfullscreen 
  mozallowfullscreen 
  msallowfullscreen>
</iframe>
```

### Add as Teams Tab
1. Open Teams channel
2. Click "+" to add tab
3. Select "Forms"
4. Choose existing form
5. Configure tab name

---

## Response Management

### Export Responses
- Excel: Download all responses
- CSV: For data analysis
- SharePoint: Automated via Power Automate

### Response Analytics
- View in Forms analytics dashboard
- Total responses
- Average completion time
- Completion rate by question
- Response trends

---

## Maintenance

### Regular Updates
- Review questions quarterly
- Update choices based on feedback
- Add/remove fields as needed
- Keep branching logic current

### Form Versioning
- Document changes in changelog
- Notify users of major updates
- Maintain old form for historical data

---

## Support Resources

- Microsoft Forms Help: https://support.microsoft.com/forms
- Form Templates: `/forms/` directory
- Power Automate Templates: `/power-automate/templates/`

---

## Contact

**Forms Administrator:** arb-forms-admin@agency.gov  
**ARB Help Desk:** arb-support@agency.gov
