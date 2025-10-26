# ARB System Installation Guide

## Overview
This guide provides step-by-step instructions for installing and configuring the complete Architecture Review Board (ARB) automation environment.

---

## Prerequisites

### Required Software and Licenses
- ✅ Microsoft 365 E3/E5 or Government equivalent
- ✅ SharePoint Online administrator access
- ✅ Power Platform environment
- ✅ Power BI Pro licenses for dashboard users
- ✅ Power Automate premium connectors (for some flows)
- ✅ Microsoft Forms (included with M365)

### Required Knowledge
- SharePoint administration
- Power Platform basics
- PowerShell (basic)
- Project management

### Estimated Time
- **Full Installation:** 8-16 hours
- **Basic Setup:** 4-6 hours
- **Testing and Validation:** 2-4 hours

---

## Installation Roadmap

```
Phase 1: SharePoint Setup (2-4 hours)
    ↓
Phase 2: Power Automate Configuration (2-3 hours)
    ↓
Phase 3: Power BI Deployment (2-3 hours)
    ↓
Phase 4: Microsoft Forms Setup (1-2 hours)
    ↓
Phase 5: Testing and Validation (2-4 hours)
    ↓
Phase 6: User Training and Launch (ongoing)
```

---

## Phase 1: SharePoint Setup

### Step 1.1: Create SharePoint Site

**Option A: Using PowerShell (Recommended)**

1. Install PnP PowerShell module:
   ```powershell
   Install-Module -Name PnP.PowerShell -Force
   ```

2. Run deployment script:
   ```powershell
   cd /sharepoint/site-structure/deployment-scripts
   .\Deploy-ARBSite.ps1 -TenantUrl "https://yourtenant-admin.sharepoint.com" `
                        -SiteUrl "https://yourtenant.sharepoint.com/sites/ARB" `
                        -Owner "arb-admin@yourtenant.com"
   ```

**Option B: Manual Setup**

1. Follow detailed instructions in `/docs/guides/sharepoint-setup.md`
2. Create site manually through SharePoint Admin Center
3. Create lists and libraries manually
4. Configure permissions manually

**Verification:**
- ✅ Site accessible at specified URL
- ✅ All lists created (ARB Submissions, Technical Reviews, Security Reviews)
- ✅ All libraries created (Submission Documents, Templates, Board Decisions)
- ✅ Navigation configured
- ✅ SharePoint groups created

### Step 1.2: Configure Permissions

1. Add users to SharePoint groups:
   - ARB Submitters (all users)
   - ARB Gatekeepers (designated staff)
   - ARB Technical Reviewers (technical team)
   - ARB Security Reviewers (security team)
   - ARB Board Members (board members)
   - ARB Administrators (admins)

2. Verify permissions for each group

**Verification:**
- ✅ Test user from each role can access appropriately
- ✅ Submitters can create items
- ✅ Reviewers can edit assigned items
- ✅ Board members can access all items

### Step 1.3: Upload Templates

1. Navigate to ARB Templates library
2. Upload files from `/templates/` directory:
   - Submission template
   - Technical review template
   - Security review template
   - Gatekeeper checklist
   - Board decision template

**Verification:**
- ✅ All template files uploaded
- ✅ Templates are accessible to all users
- ✅ Templates can be downloaded

---

## Phase 2: Power Automate Configuration

### Step 2.1: Import Flows

**For Each Flow in `/power-automate/flows/`:**

1. Go to https://make.powerautomate.com
2. Select your environment
3. Click "My flows" > "Import" > "Import Package (Legacy)"
4. Select flow JSON file
5. Click "Import"

**Note:** JSON files are configuration examples. Flows must be built using the Power Automate designer based on these specifications.

### Step 2.2: Configure Connections

For each imported flow:

1. Edit the flow
2. Update connections:
   - SharePoint connection → Your ARB site
   - Outlook connection → Your email
   - Approvals connection → Your environment

3. Update site URLs and list names
4. Test the flow

### Step 2.3: Essential Flows to Create

**Priority 1 (Must Have):**
1. ARB-001-Intake-Notification
2. ARB-002-Gatekeeper-Assignment
3. ARB-007-Decision-Notification

**Priority 2 (Should Have):**
4. ARB-003-Technical-Review-Assignment
5. ARB-004-Security-Review-Assignment
6. ARB-005-Review-Reminder
7. ARB-008-SLA-Escalation

**Priority 3 (Nice to Have):**
8. ARB-006-Board-Notification
9. ARB-009-Status-Update
10. ARB-010-Document-Generation

**Verification:**
- ✅ All flows imported successfully
- ✅ Connections configured and authenticated
- ✅ Test runs complete without errors
- ✅ Email notifications working
- ✅ SharePoint updates occurring

---

## Phase 3: Power BI Deployment

### Step 3.1: Create Dashboards

Follow detailed guide in `/docs/guides/power-bi-setup.md`

1. Install Power BI Desktop
2. Create new report
3. Connect to SharePoint data sources:
   - Site: `https://yourtenant.sharepoint.com/sites/ARB`
   - Lists: ARB Submissions, Technical Reviews, Security Reviews

4. Build data model
5. Create measures and calculated columns
6. Build visualizations for each dashboard

### Step 3.2: Publish to Service

1. Click "Publish" in Power BI Desktop
2. Select workspace
3. Wait for publish to complete
4. Configure scheduled refresh:
   - Executive Dashboard: Daily at 6 AM
   - Operational Dashboard: Every 2 hours
   - Reviewer Dashboard: Hourly
   - Compliance Dashboard: Daily at 7 AM

### Step 3.3: Configure Security

1. Set up Row-Level Security (RLS)
2. Create roles:
   - Reviewer (sees own items)
   - Board Member (sees all items)
   - Administrator (sees all items)
3. Assign users to roles

### Step 3.4: Embed in SharePoint

1. Create "Dashboards" page in ARB site
2. Add Power BI web parts
3. Configure each web part with report URL
4. Test access from different user roles

**Verification:**
- ✅ Dashboards display data correctly
- ✅ Scheduled refresh working
- ✅ RLS enforced properly
- ✅ Embedded dashboards accessible
- ✅ Performance acceptable

---

## Phase 4: Microsoft Forms Setup

### Step 4.1: Create ARB Intake Form

Follow guide in `/docs/guides/forms-configuration.md`

1. Go to https://forms.microsoft.com
2. Create new form: "ARB Architecture Review Request"
3. Add sections and questions as specified
4. Configure branching logic
5. Set form settings:
   - Require sign-in
   - One response per person
   - Response receipts

### Step 4.2: Integrate with SharePoint

1. Create Power Automate flow:
   - Trigger: When new form response submitted
   - Actions:
     - Generate Submission ID
     - Create item in ARB Submissions list
     - Upload attachments to document library
     - Trigger intake notification flow

2. Test form submission end-to-end

### Step 4.3: Create Review Forms (Optional)

1. Technical Review Assessment Form
2. Security Review Assessment Form
3. Link forms from SharePoint

**Verification:**
- ✅ Form accessible to all users
- ✅ Form submissions create SharePoint items
- ✅ Attachments upload correctly
- ✅ Notifications trigger
- ✅ Submission ID generated

---

## Phase 5: Testing and Validation

### Step 5.1: Create Test Submissions

1. Create test submission as Submitter
2. Verify intake notification sent
3. Assign as Gatekeeper
4. Complete technical review
5. Complete security review
6. Process board decision
7. Verify final notification

### Step 5.2: Test All Workflows

**Test Scenarios:**
1. ✅ Happy path (submission to approval)
2. ✅ Rejection scenario
3. ✅ Conditional approval
4. ✅ Returned to submitter
5. ✅ SLA escalation
6. ✅ Email notifications
7. ✅ Dashboard updates
8. ✅ Permissions and security

### Step 5.3: User Acceptance Testing

1. Select pilot users from each role
2. Provide test scenarios
3. Gather feedback
4. Fix issues
5. Iterate

**Verification:**
- ✅ End-to-end process works
- ✅ All roles can perform their tasks
- ✅ Notifications received
- ✅ Dashboards update correctly
- ✅ No security issues
- ✅ Performance acceptable
- ✅ User feedback positive

---

## Phase 6: User Training and Launch

### Step 6.1: Prepare Training Materials

1. Review user guide: `/docs/guides/user-guide.md`
2. Create video tutorials (optional)
3. Prepare FAQ document
4. Create quick reference cards

### Step 6.2: Conduct Training

**For Submitters:**
- 1-hour overview session
- How to submit requests
- How to track submissions
- Q&A

**For Reviewers:**
- 2-hour deep-dive
- Review process
- Using templates
- Best practices
- Q&A

**For Board Members:**
- 2-hour session
- Decision-making process
- Using dashboards
- Governance policies
- Q&A

**For Administrators:**
- 4-hour technical session
- System administration
- Troubleshooting
- Maintenance procedures
- Q&A

### Step 6.3: Soft Launch

1. Announce ARB system to organization
2. Start with pilot group (limited users)
3. Monitor closely for issues
4. Gather feedback
5. Make adjustments

### Step 6.4: Full Launch

1. Announce to all users
2. Provide support during transition
3. Monitor usage and performance
4. Address issues promptly

**Verification:**
- ✅ All users trained
- ✅ Documentation accessible
- ✅ Support resources available
- ✅ System stable
- ✅ Users successfully submitting requests
- ✅ Positive feedback

---

## Post-Installation Tasks

### Week 1
- Monitor system closely
- Address any issues immediately
- Provide additional support as needed
- Collect feedback

### Month 1
- Review metrics and KPIs
- Identify bottlenecks
- Optimize workflows
- Update documentation
- Conduct retrospective

### Month 3
- Full system review
- Gather comprehensive feedback
- Plan enhancements
- Update training materials
- Celebrate successes

---

## Troubleshooting Common Issues

### SharePoint Access Issues
**Problem:** Users can't access site  
**Solution:**
1. Check SharePoint group membership
2. Verify site permissions
3. Check license assignment
4. Clear browser cache

### Flow Not Triggering
**Problem:** Power Automate flow doesn't run  
**Solution:**
1. Check flow is turned on
2. Verify trigger conditions
3. Check connections
4. Review run history for errors

### Dashboard Not Refreshing
**Problem:** Power BI shows old data  
**Solution:**
1. Check scheduled refresh settings
2. Verify credentials
3. Check SharePoint permissions
4. Review refresh history

### Emails Not Sending
**Problem:** Notifications not received  
**Solution:**
1. Check spam/junk folders
2. Verify email addresses
3. Check flow configuration
4. Test email connection

---

## Maintenance and Support

### Daily
- Monitor flow runs
- Check for errors
- Respond to support requests

### Weekly
- Review metrics
- Check system performance
- Update documentation

### Monthly
- Full system health check
- Review and optimize
- User feedback session
- Update FAQs

### Quarterly
- Governance policy review
- Process improvement
- Feature enhancements
- Comprehensive audit

---

## Getting Help

### Documentation
- Main README: `/README.md`
- User Guide: `/docs/guides/user-guide.md`
- SharePoint Setup: `/docs/guides/sharepoint-setup.md`
- Power Automate Guide: `/docs/guides/power-automate-deployment.md`
- Power BI Guide: `/docs/guides/power-bi-setup.md`
- Forms Guide: `/docs/guides/forms-configuration.md`

### Support Contacts
- **ARB Help Desk:** arb-support@agency.gov
- **System Administrator:** arb-admin@agency.gov
- **ARB Chair:** arb-chair@agency.gov

### Community Resources
- Internal Teams channel
- Monthly office hours
- Quarterly user group meetings

---

## Success Criteria

The installation is successful when:

✅ All components deployed (SharePoint, Power Automate, Power BI, Forms)  
✅ End-to-end testing completed successfully  
✅ All user roles can perform their functions  
✅ Notifications working correctly  
✅ Dashboards displaying accurate data  
✅ Users trained and comfortable with system  
✅ Support structure in place  
✅ Documentation complete and accessible  
✅ Positive user feedback  
✅ System meeting SLA targets  

---

## Next Steps After Installation

1. **Monitor and Optimize**
   - Track usage patterns
   - Identify bottlenecks
   - Optimize based on data

2. **Continuous Improvement**
   - Gather user feedback
   - Implement enhancements
   - Update processes

3. **Expand Capabilities**
   - Add integrations (ServiceNow, Azure DevOps, etc.)
   - Enhance dashboards
   - Automate more processes

4. **Knowledge Sharing**
   - Document lessons learned
   - Share best practices
   - Mentor new users

---

## Conclusion

Congratulations on installing the ARB automation system! This powerful platform will streamline your architecture governance process, improve decision quality, and provide valuable insights into your technology portfolio.

Remember:
- Start small and iterate
- Listen to user feedback
- Keep improving
- Celebrate wins
- Build a community

**Questions?** Contact the ARB Help Desk or refer to the comprehensive documentation provided.

Good luck with your ARB implementation!
