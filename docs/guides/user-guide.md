# ARB User Guide

## Welcome to the Architecture Review Board System

This guide will help you navigate and use the ARB automation system effectively.

---

## Table of Contents

1. [Getting Started](#getting-started)
2. [Submitting a Request](#submitting-a-request)
3. [Tracking Your Submission](#tracking-your-submission)
4. [Understanding the Review Process](#understanding-the-review-process)
5. [Responding to Feedback](#responding-to-feedback)
6. [FAQs](#faqs)
7. [Getting Help](#getting-help)

---

## Getting Started

### Access the ARB Portal

1. Navigate to: `https://yourtenant.sharepoint.com/sites/ARB`
2. Bookmark this page for easy access
3. Ensure you have the appropriate permissions

### First Time Setup

**Required Actions:**
- Verify your user profile is up to date
- Join Microsoft Teams ARB channel (optional but recommended)
- Review the ARB process documentation
- Download submission templates

**Recommended Actions:**
- Subscribe to ARB announcements
- Set up email notifications
- Review previous approved submissions for examples

---

## Submitting a Request

### When to Submit an ARB Request

Submit an ARB request for:
- ✅ New application development
- ✅ Infrastructure changes
- ✅ Cloud migrations
- ✅ Major system upgrades
- ✅ New integrations
- ✅ Security architecture changes
- ✅ Data architecture changes

**NOT required for:**
- ❌ Routine maintenance
- ❌ Minor patches and updates
- ❌ Standard desktop software requests
- ❌ Projects under $10,000 (unless security-related)

### Submission Methods

#### Method 1: Microsoft Forms (Recommended for New Users)

1. Go to ARB Portal → "Submit Request"
2. Click "Fill Out Form"
3. Complete all required fields
4. Attach required documents
5. Review and submit

**Advantages:**
- Guided experience
- Built-in validation
- Automatic submission ID generation
- Immediate confirmation

#### Method 2: Direct SharePoint Entry (For Experienced Users)

1. Go to ARB Submissions list
2. Click "New"
3. Fill in all required fields
4. Save the item
5. Upload documents to corresponding folder

**Advantages:**
- Faster for repeat users
- More flexibility
- Direct access to all fields

### Required Information

#### Basic Information
- Project name
- Business unit
- Project type
- Priority level
- Business sponsor
- Estimated cost
- Timeline

#### Technical Details
- Current state description
- Proposed architecture
- Technology stack
- System integrations
- Data architecture
- Security requirements

#### Business Justification
- Executive summary (200-500 words)
- Business benefits (minimum 3)
- Success criteria (minimum 3)
- Risk assessment

#### Required Documents
- Architecture diagram
- Data flow diagram (if applicable)
- Cost-benefit analysis
- Risk assessment
- Security assessment (for security projects)
- Privacy Impact Assessment (if handling PII/PHI)

### Document Requirements

**Architecture Diagrams:**
- Format: PDF, Visio, or PowerPoint
- Must show: System components, data flows, integration points
- Should be clear and readable
- Include legend if needed

**Technical Specifications:**
- Format: Word or PDF
- Include: Detailed requirements, technical approach, implementation plan

**Cost Analysis:**
- Format: Excel or PDF
- Include: CapEx, OpEx, 3-year total cost
- Show ROI calculation

### Tips for a Strong Submission

✅ **DO:**
- Be clear and concise
- Use diagrams and visuals
- Provide realistic estimates
- Identify risks upfront
- Reference enterprise standards
- Include all required documents
- Proofread before submitting

❌ **DON'T:**
- Leave required fields blank
- Provide vague descriptions
- Underestimate costs or timelines
- Hide or minimize risks
- Propose unapproved technologies without justification
- Submit incomplete documentation

---

## Tracking Your Submission

### View Your Submissions

**Option 1: My Submissions View**
1. Go to ARB Portal
2. Click "My Submissions" in the navigation
3. See all your submissions and their current status

**Option 2: Dashboard**
1. Navigate to "Dashboards"
2. Use filters to find your submissions
3. See detailed metrics and timelines

### Understanding Status Values

| Status | Meaning | What's Happening | Typical Duration |
|--------|---------|------------------|------------------|
| **Draft** | Not yet submitted | You're still editing | N/A |
| **Submitted** | Initial submission received | Waiting for gatekeeper review | 1-2 days |
| **In Intake Review** | Gatekeeper is reviewing | Completeness check, reviewer assignment | 2-3 days |
| **In Technical Review** | Technical team is assessing | Architecture and technical evaluation | 5-7 days |
| **In Security Review** | Security team is assessing | Security and compliance evaluation | 5-7 days |
| **In Board Review** | Board is reviewing | Final decision process | 7-10 days |
| **Approved** | Board approved the request | Proceed to implementation | Complete |
| **Conditional Approval** | Approved with conditions | Meet conditions before proceeding | Varies |
| **Rejected** | Board rejected the request | Review feedback and resubmit if appropriate | Complete |
| **Returned to Submitter** | Needs more information | Provide requested information | Until resubmitted |

### Email Notifications

You will receive emails for:
- ✉️ Submission confirmation
- ✉️ Status changes
- ✉️ Reviewer questions or comments
- ✉️ Approaching deadlines
- ✉️ Final decision notification

**Configure Notifications:**
1. Go to ARB Portal → Settings
2. Select "Alert Me"
3. Choose notification preferences

### SLA Tracking

**Standard SLA:** 27 business days total
- Intake Review: 3 days
- Technical Review: 7 days
- Security Review: 7 days
- Board Review: 10 days

**Monitor Your SLA:**
- Check "SLA Status" field in your submission
- Green = On Track
- Yellow = At Risk
- Red = Breached

**If SLA is Breached:**
- Automatic escalation occurs
- You'll be notified
- ARB leadership will be involved

---

## Understanding the Review Process

### Stage 1: Intake Review (Gatekeeper)

**What Happens:**
- Gatekeeper reviews for completeness
- Checks quality of submission
- Assigns technical and security reviewers
- Validates alignment with enterprise strategy

**Your Role:**
- Ensure all required information is provided
- Respond quickly to any questions
- Be available for clarification

**Possible Outcomes:**
- ✅ Accepted → Moves to technical review
- ↩️ Returned → You need to provide more information
- ❌ Rejected → Does not meet ARB criteria

### Stage 2: Technical Review

**What Happens:**
- Technical reviewer evaluates architecture
- Assesses scalability, performance, maintainability
- Checks standards compliance
- Identifies technical risks

**Your Role:**
- Be available to answer technical questions
- Provide additional details if requested
- Attend technical review meeting if scheduled

**Review Areas:**
- Architecture alignment
- Technology stack
- Scalability and performance
- Integration approach
- Data architecture
- Operational readiness

### Stage 3: Security Review

**What Happens:**
- Security reviewer assesses security posture
- Evaluates compliance requirements
- Reviews authentication and authorization
- Assesses data protection measures

**Your Role:**
- Provide security documentation
- Answer security-related questions
- Address security concerns
- May need to involve your security team

**Review Areas:**
- Authentication and authorization
- Data protection and encryption
- Compliance with regulations
- Vulnerability management
- Security monitoring
- Incident response

### Stage 4: Board Review

**What Happens:**
- Board members review submission package
- Consider technical and security assessments
- Evaluate business value and strategic alignment
- Vote on the proposal

**Your Role:**
- Board may request presentation
- Be prepared to defend your proposal
- Answer board questions
- Provide clarifications

**Board Composition:**
- Chief Architect (Chair)
- Security Officer
- Infrastructure Lead
- Application Development Lead
- Enterprise Architecture Lead
- Business Representatives

---

## Responding to Feedback

### If Your Submission is Returned

1. **Review Feedback Carefully**
   - Read all comments from gatekeeper
   - Understand what's missing or unclear
   - Note all requested items

2. **Gather Required Information**
   - Collect missing documents
   - Clarify unclear sections
   - Address all concerns

3. **Update Your Submission**
   - Edit the SharePoint item
   - Upload new or revised documents
   - Add comments explaining changes

4. **Resubmit**
   - Change status back to "Submitted"
   - Notify gatekeeper via email
   - Reference original submission ID

### If You Receive Conditional Approval

1. **Review Conditions**
   - Read all conditions carefully
   - Understand what must be done
   - Note deadlines

2. **Create Action Plan**
   - List all conditions
   - Assign owners for each condition
   - Set target completion dates

3. **Meet Conditions**
   - Complete all required actions
   - Document compliance
   - Gather evidence

4. **Submit Verification**
   - Provide evidence of compliance
   - Update submission with details
   - Request verification from ARB

### If Your Submission is Rejected

1. **Understand Why**
   - Review rejection reasons
   - Request clarification if needed
   - Identify root causes

2. **Evaluate Options**
   - Can concerns be addressed?
   - Is there an alternative approach?
   - Should you appeal?

3. **Decide Next Steps**
   - **Option 1:** Address concerns and resubmit
   - **Option 2:** Pursue alternative approach
   - **Option 3:** Appeal decision (within 15 days)
   - **Option 4:** Withdraw project

4. **If Resubmitting**
   - Create new submission
   - Reference previous submission
   - Clearly explain how concerns were addressed

---

## FAQs

### General Questions

**Q: How long does the ARB process take?**  
A: The standard process takes up to 27 business days. Expedited review (15 days) is available for critical projects with proper justification.

**Q: Can I submit on behalf of someone else?**  
A: Yes, but ensure you have authority and can answer questions about the project.

**Q: What if I need to update my submission after it's been submitted?**  
A: Contact your assigned reviewer or the ARB help desk. Minor updates can be made; major changes may require resubmission.

**Q: Can I withdraw my submission?**  
A: Yes, update the status to "Withdrawn" and notify the ARB help desk.

### Technical Questions

**Q: What if I need to use a non-standard technology?**  
A: Provide strong justification including technical merits, business benefits, and why standard technologies won't work.

**Q: Do I need separate submissions for each phase of a multi-phase project?**  
A: It depends. If architectures differ significantly between phases, submit separately. Otherwise, one submission covering all phases is acceptable.

**Q: What level of detail is needed in architecture diagrams?**  
A: High-level logical diagrams are required. Detailed technical diagrams are helpful but not mandatory.

### Process Questions

**Q: Can I attend the board meeting?**  
A: The board may request your presence for complex or strategic projects. You'll be notified if needed.

**Q: What happens if I miss the SLA deadline?**  
A: Automatic escalation occurs. This doesn't mean rejection, but helps ensure timely review.

**Q: Can I request a specific reviewer?**  
A: You can request, but the gatekeeper makes final assignments based on expertise and workload.

**Q: What's the appeal process?**  
A: Submit appeal within 15 business days to ARB chair with justification. Appeals are reviewed by executive board.

---

## Getting Help

### Self-Service Resources

**Documentation:**
- 📖 [ARB Process Guide](/docs/processes/arb-process.md)
- 📖 [Submission Template](/templates/submission/arb-submission-template.md)
- 📖 [Sample Submissions](/examples/) (on SharePoint)

**Videos and Tutorials:**
- 🎥 How to Submit an ARB Request
- 🎥 Understanding the Review Process
- 🎥 Navigating the ARB Portal
- (Available on SharePoint → Help & Resources)

**Templates and Examples:**
- Architecture diagram templates
- Cost-benefit analysis template
- Risk assessment template
- Example approved submissions

### Contact Support

**ARB Help Desk**
- 📧 Email: arb-support@agency.gov
- 📞 Phone: (123) 456-7890
- 💬 Teams: @ARB Help Desk
- ⏰ Hours: Monday-Friday, 8:00 AM - 5:00 PM EST

**For Specific Issues:**

| Issue Type | Contact |
|-----------|---------|
| Technical questions about your submission | Your assigned technical reviewer |
| Security questions | Your assigned security reviewer |
| Process questions | ARB Gatekeeper or Help Desk |
| System/access issues | IT Service Desk |
| Escalations | ARB Chair (arb-chair@agency.gov) |

### Office Hours

**Weekly ARB Office Hours:**
- 📅 Every Wednesday, 2:00 PM - 4:00 PM EST
- 📍 Teams Meeting (link in calendar invite)
- 👥 Drop in with questions
- No registration required

### Training

**ARB Basics Training:**
- Monthly sessions (first Tuesday of each month)
- 1-hour online course
- Register: arb-training@agency.gov

**Advanced ARB Topics:**
- Quarterly deep-dive sessions
- Topics: Complex architectures, Cloud migrations, Security compliance
- Register through training portal

---

## Best Practices

### Before You Submit
✅ Review similar approved submissions  
✅ Consult with enterprise architects early  
✅ Involve security team from the start  
✅ Get business sponsor buy-in  
✅ Prepare comprehensive documentation  

### During Review
✅ Respond promptly to questions  
✅ Be transparent about challenges  
✅ Keep stakeholders informed  
✅ Maintain professional communication  
✅ Be open to feedback and suggestions  

### After Approval
✅ Implement according to approved architecture  
✅ Report deviations immediately  
✅ Complete post-implementation review  
✅ Share lessons learned  
✅ Keep ARB documentation updated  

---

## Quick Reference Card

### Key Links
- **ARB Portal:** https://yourtenant.sharepoint.com/sites/ARB
- **Submit Request:** .../Lists/ARBSubmissions/NewForm.aspx
- **My Submissions:** .../Lists/ARBSubmissions/MySubmissions.aspx
- **Dashboards:** .../SitePages/Dashboards.aspx
- **Help:** arb-support@agency.gov

### Important Timelines
- Intake Review: 3 business days
- Technical Review: 7 business days
- Security Review: 7 business days
- Board Review: 10 business days
- **Total:** 27 business days

### Priority Definitions
- **Critical:** Immediate business impact
- **High:** Significant business value
- **Medium:** Important but not urgent
- **Low:** Nice to have

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2024-01-01 | Initial release |

---

**Last Updated:** [Current Date]  
**Questions?** Contact arb-support@agency.gov
