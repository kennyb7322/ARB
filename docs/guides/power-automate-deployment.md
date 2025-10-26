# Power Automate Flow Deployment Guide

## Overview
This guide covers the deployment and configuration of all Power Automate flows for the ARB automation system.

## Prerequisites
- Power Platform environment access
- SharePoint site configured (see sharepoint-setup.md)
- Premium connectors license (for some flows)
- Service account for flow execution (recommended)

## Flow Architecture

### Core Flows
1. **ARB-001-Intake-Notification** - Notifies gatekeepers of new submissions
2. **ARB-002-Gatekeeper-Assignment** - Auto-assigns gatekeepers based on rules
3. **ARB-003-Technical-Review-Assignment** - Assigns technical reviewers
4. **ARB-004-Security-Review-Assignment** - Assigns security reviewers
5. **ARB-005-Review-Reminder** - Sends reminders for pending reviews
6. **ARB-006-Board-Notification** - Notifies board of items ready for review
7. **ARB-007-Decision-Notification** - Notifies stakeholders of decisions
8. **ARB-008-SLA-Escalation** - Escalates items exceeding SLA
9. **ARB-009-Status-Update** - Updates submission status automatically
10. **ARB-010-Document-Generation** - Generates decision documents

## Flow Deployment Steps

### Method 1: Manual Import (Recommended for Initial Setup)

1. **Access Power Automate**
   - Navigate to https://make.powerautomate.com
   - Select your environment
   - Click "My flows" > "Import" > "Import Package (Legacy)"

2. **Import Each Flow**
   - Download flow packages from `/power-automate/flows/` directory
   - Import .zip files one at a time
   - Configure connections during import

3. **Update Connections**
   - SharePoint connection
   - Office 365 Outlook connection
   - Office 365 Users connection
   - Approval connection

### Method 2: Automated Deployment (PowerShell)

```powershell
# Install Power Platform CLI
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell
Install-Module -Name Microsoft.PowerApps.PowerShell -AllowClobber

# Connect to environment
Add-PowerAppsAccount

# List environments
Get-AdminPowerAppEnvironment

# Set target environment
$EnvironmentName = "your-environment-name"

# Import flows (requires PAC CLI)
pac auth create --url https://yourorg.crm.dynamics.com
pac solution import --path "ARB-Flows-Solution.zip"
```

## Flow Configurations

### ARB-001: Intake Notification Flow

**Trigger**: When an item is created in ARB Submissions list  
**Actions**:
1. Get submitter details
2. Get gatekeeper group members
3. Send email to gatekeepers
4. Update Status to "Submitted"
5. Create notification in Teams (optional)

**Configuration**:
```json
{
  "trigger": {
    "type": "SharePoint",
    "operation": "When an item is created",
    "siteAddress": "https://yourtenant.sharepoint.com/sites/ARB",
    "listName": "ARB Submissions"
  },
  "actions": {
    "emailTemplate": "New ARB Submission",
    "recipients": "ARB Gatekeepers",
    "includeAttachments": false
  }
}
```

### ARB-002: Gatekeeper Assignment Flow

**Trigger**: When an item is created in ARB Submissions list  
**Actions**:
1. Get business unit from submission
2. Apply assignment rules based on business unit
3. Update Gatekeeper field
4. Send notification to assigned gatekeeper

**Assignment Rules**:
```javascript
// Business Unit to Gatekeeper mapping
const assignmentRules = {
  "IT Infrastructure": "john.smith@agency.gov",
  "Application Development": "jane.doe@agency.gov",
  "Data Services": "bob.johnson@agency.gov",
  "Security": "alice.williams@agency.gov",
  "Default": "arb.gatekeeper@agency.gov"
};
```

### ARB-003: Technical Review Assignment Flow

**Trigger**: When Status changes to "In Technical Review"  
**Actions**:
1. Get project type
2. Find available technical reviewer
3. Check reviewer workload
4. Assign reviewer
5. Send notification with review deadline
6. Create calendar event

**Reviewer Selection Logic**:
- Round-robin by project type
- Check current workload (max 5 active reviews)
- Prefer subject matter experts for specific tech stacks

### ARB-004: Security Review Assignment Flow

**Trigger**: When Status changes to "In Security Review"  
**Actions**:
1. Get project details
2. Determine security classification
3. Assign appropriate security reviewer
4. Send notification
5. Schedule security review meeting if needed

### ARB-005: Review Reminder Flow

**Trigger**: Scheduled (Daily at 9 AM)  
**Actions**:
1. Query all active reviews
2. Calculate days remaining
3. Send reminder emails:
   - 2 days before deadline: First reminder
   - 1 day before deadline: Urgent reminder
   - Day of deadline: Final reminder
   - Past deadline: Escalation

**Email Escalation Matrix**:
| Days Overdue | Recipients |
|--------------|------------|
| 0-2 days | Reviewer |
| 3-5 days | Reviewer + Manager |
| 6+ days | Reviewer + Manager + ARB Chair |

### ARB-006: Board Notification Flow

**Trigger**: When Status changes to "In Board Review"  
**Actions**:
1. Compile submission package
2. Get board members list
3. Send package to all board members
4. Schedule on next board meeting agenda
5. Create Teams channel discussion (optional)

### ARB-007: Decision Notification Flow

**Trigger**: When Decision field is updated  
**Actions**:
1. Generate decision letter (Word template)
2. Save to Board Decisions library
3. Send email to:
   - Submitter
   - Project sponsor
   - Technical reviewer
   - Security reviewer
   - Stakeholders
4. Update project tracking system (if integrated)
5. Archive submission documents

**Decision Letter Template Variables**:
- Submission ID
- Project Name
- Decision (Approved/Conditional/Rejected)
- Decision Date
- Board Comments
- Next Steps
- Conditions (if applicable)

### ARB-008: SLA Escalation Flow

**Trigger**: Scheduled (Every 4 hours)  
**Actions**:
1. Check all submissions against SLA
2. Calculate time in each stage
3. Identify SLA violations:
   - Intake Review: >3 days
   - Technical Review: >7 days
   - Security Review: >7 days
   - Board Review: >10 days
4. Send escalation emails
5. Update dashboard metrics

**Escalation Email Template**:
```
Subject: ARB SLA Escalation - {SubmissionID}

The following ARB submission has exceeded the SLA:

Submission ID: {SubmissionID}
Project: {ProjectName}
Current Stage: {Status}
Days in Stage: {DaysInStage}
SLA Threshold: {SLADays} days
Days Overdue: {DaysOverdue}

Action Required: Please review and advance this submission.
```

### ARB-009: Status Update Flow

**Trigger**: When an item is modified in Technical Reviews or Security Reviews  
**Actions**:
1. Check if all required reviews are complete
2. Update submission status accordingly:
   - All tech reviews done → "In Security Review"
   - All security reviews done → "In Board Review"
3. Send notifications
4. Update metrics

### ARB-010: Document Generation Flow

**Trigger**: Manually triggered or on approval  
**Actions**:
1. Get submission details
2. Populate Word template
3. Convert to PDF
4. Save to library
5. Email to recipients

**Generated Documents**:
- Approval Letter
- Conditional Approval Letter (with requirements)
- Rejection Letter (with reasons and alternatives)
- Board Decision Summary
- Implementation Authorization

## Approval Workflows

### Multi-Stage Approval Configuration

```json
{
  "approvalType": "Sequential",
  "stages": [
    {
      "stage": "Gatekeeper Review",
      "approvers": "Dynamic (assigned gatekeeper)",
      "timeout": "3 days",
      "escalation": "Manager"
    },
    {
      "stage": "Technical Review",
      "approvers": "Dynamic (assigned technical reviewer)",
      "timeout": "7 days",
      "escalation": "Team Lead"
    },
    {
      "stage": "Security Review",
      "approvers": "Dynamic (assigned security reviewer)",
      "timeout": "7 days",
      "escalation": "Security Manager"
    },
    {
      "stage": "Board Decision",
      "approvers": "All board members",
      "approvalType": "Majority",
      "timeout": "10 days",
      "escalation": "ARB Chair"
    }
  ]
}
```

## Testing Flows

### Test Scenarios

1. **Happy Path Test**
   - Create submission
   - Verify notifications sent
   - Complete reviews
   - Verify status progression
   - Confirm decision notification

2. **Rejection Test**
   - Create submission
   - Fail technical review
   - Verify rejection notification
   - Confirm proper status update

3. **Conditional Approval Test**
   - Create submission
   - Add conditions in review
   - Verify conditional approval letter
   - Test condition tracking

4. **SLA Escalation Test**
   - Create old submission
   - Wait for escalation trigger
   - Verify escalation emails
   - Confirm metrics update

### Test Checklist
- [ ] All flows turn on without errors
- [ ] Connections authenticated
- [ ] Email notifications received
- [ ] Status updates working
- [ ] SLA calculations correct
- [ ] Document generation successful
- [ ] Escalations triggering properly
- [ ] Approval chains functioning
- [ ] Error handling working
- [ ] Flow run history clean

## Monitoring and Maintenance

### Flow Monitoring Dashboard

Monitor these metrics:
- Flow run success rate
- Average execution time
- Failed runs and errors
- Email delivery rate
- SLA compliance rate

### Regular Maintenance Tasks

**Daily**:
- Check flow run history for errors
- Review escalation queue
- Verify email delivery

**Weekly**:
- Review performance metrics
- Update assignment rules if needed
- Check connection health

**Monthly**:
- Audit flow configurations
- Review and optimize slow flows
- Update templates
- Clean up old flow runs

### Error Handling

Common errors and solutions:

**Error**: "Item not found"  
**Solution**: Check SharePoint permissions and item IDs

**Error**: "Connection not configured"  
**Solution**: Re-authenticate connections in flow settings

**Error**: "Timeout executing request"  
**Solution**: Add retry policy or break into smaller actions

**Error**: "Recipient not found"  
**Solution**: Validate email addresses in SharePoint groups

## Advanced Configurations

### Dynamic Content Usage

```
Submission Details:
- @{triggerOutputs()?['body/ProjectName']}
- @{triggerOutputs()?['body/SubmissionID']}
- @{triggerOutputs()?['body/Status']}

Calculated Values:
- Days in Stage: @{div(sub(ticks(utcNow()), ticks(triggerOutputs()?['body/Modified'])), 864000000000)}
- SLA Breached: @{if(greater(variables('DaysInStage'), 7), 'Yes', 'No')}
```

### Conditional Logic

```
Approval Required If:
- EstimatedCost > $100,000
- Priority = "Critical" OR "High"
- ProjectType = "Security" OR "Infrastructure"
```

### Integration Points

- **Microsoft Teams**: Post updates to ARB channel
- **Planner**: Create tasks for reviewers
- **Power BI**: Trigger dataset refresh
- **ServiceNow**: Create change requests
- **Azure DevOps**: Create work items

## Security Best Practices

1. **Use Service Account**: Create dedicated service account for flows
2. **Least Privilege**: Grant minimum required permissions
3. **Secure Connections**: Use organizational accounts, not personal
4. **Sensitive Data**: Encrypt sensitive information in flow variables
5. **Audit Logging**: Enable and review flow audit logs
6. **Version Control**: Export and back up flow definitions

## Troubleshooting Guide

### Flow Not Triggering

1. Check trigger conditions
2. Verify SharePoint permissions
3. Check flow status (on/off)
4. Review connection authentication

### Emails Not Sending

1. Verify SMTP settings
2. Check recipient email addresses
3. Review email templates
4. Check spam/junk folders

### Performance Issues

1. Reduce concurrent actions
2. Add delays between actions
3. Use batch operations where possible
4. Optimize SharePoint queries

## Support and Resources

- Flow Templates: `/power-automate/flows/`
- Email Templates: `/power-automate/templates/email-templates/`
- Power Automate Community: https://powerusers.microsoft.com/
- Microsoft Documentation: https://docs.microsoft.com/power-automate/

## Next Steps

1. Test all flows in development environment
2. Deploy to production
3. Train users on process
4. Monitor for issues
5. Gather feedback for improvements
