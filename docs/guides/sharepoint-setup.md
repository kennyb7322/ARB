# SharePoint Site Setup Guide

## Overview
This guide provides step-by-step instructions for setting up the Architecture Review Board (ARB) SharePoint environment.

## Prerequisites
- SharePoint Online administrator access
- Power Platform environment access
- Microsoft 365 tenant
- Appropriate licenses for users

## Site Architecture

### Site Collection Structure
```
ARB Portal (Communication Site)
├── Home (Landing page with quick links and announcements)
├── Submissions (Document library for ARB requests)
├── Technical Reviews (List for tracking technical reviews)
├── Security Reviews (List for tracking security reviews)
├── Board Decisions (Document library for decisions)
├── Templates (Document library for templates)
├── Dashboards (Page with embedded Power BI reports)
└── Help & Resources (Page with documentation)
```

## Step 1: Create the Main Site

### Using SharePoint Admin Center:
1. Navigate to SharePoint Admin Center
2. Click "Active sites" > "Create"
3. Select "Communication site"
4. Configure:
   - **Site name**: Architecture Review Board
   - **Site address**: /sites/ARB
   - **Language**: English
   - **Site design**: Topic
   - **Privacy settings**: Private (requires membership)

### Using PnP PowerShell:
```powershell
# Connect to SharePoint
Connect-PnPOnline -Url "https://yourtenant-admin.sharepoint.com" -Interactive

# Create the site
New-PnPSite -Type CommunicationSite `
    -Title "Architecture Review Board" `
    -Url "https://yourtenant.sharepoint.com/sites/ARB" `
    -Description "Enterprise Architecture Review Board Portal" `
    -Owner "arb-admin@yourtenant.onmicrosoft.com"
```

## Step 2: Create Custom Lists

### ARB Submissions List
```powershell
Connect-PnPOnline -Url "https://yourtenant.sharepoint.com/sites/ARB" -Interactive

# Create the list
New-PnPList -Title "ARB Submissions" -Template GenericList -Url "Lists/ARBSubmissions"

# Add custom columns
Add-PnPField -List "ARB Submissions" -DisplayName "Submission ID" -InternalName "SubmissionID" -Type Text -Required
Add-PnPField -List "ARB Submissions" -DisplayName "Project Name" -InternalName "ProjectName" -Type Text -Required
Add-PnPField -List "ARB Submissions" -DisplayName "Submitter Email" -InternalName "SubmitterEmail" -Type Text -Required
Add-PnPField -List "ARB Submissions" -DisplayName "Submission Date" -InternalName "SubmissionDate" -Type DateTime -Required
Add-PnPField -List "ARB Submissions" -DisplayName "Status" -InternalName "Status" -Type Choice -Choices "Draft","Submitted","In Intake Review","In Technical Review","In Security Review","In Board Review","Approved","Conditional Approval","Rejected" -Required
Add-PnPField -List "ARB Submissions" -DisplayName "Priority" -InternalName "Priority" -Type Choice -Choices "Critical","High","Medium","Low"
Add-PnPField -List "ARB Submissions" -DisplayName "Business Unit" -InternalName "BusinessUnit" -Type Text
Add-PnPField -List "ARB Submissions" -DisplayName "Project Type" -InternalName "ProjectType" -Type Choice -Choices "Infrastructure","Application","Data","Security","Cloud","Integration"
Add-PnPField -List "ARB Submissions" -DisplayName "Estimated Cost" -InternalName "EstimatedCost" -Type Currency
Add-PnPField -List "ARB Submissions" -DisplayName "Proposed Start Date" -InternalName "ProposedStartDate" -Type DateTime
Add-PnPField -List "ARB Submissions" -DisplayName "Technical Reviewer" -InternalName "TechnicalReviewer" -Type User
Add-PnPField -List "ARB Submissions" -DisplayName "Security Reviewer" -InternalName "SecurityReviewer" -Type User
Add-PnPField -List "ARB Submissions" -DisplayName "Gatekeeper" -InternalName "Gatekeeper" -Type User
Add-PnPField -List "ARB Submissions" -DisplayName "Board Decision Date" -InternalName "BoardDecisionDate" -Type DateTime
Add-PnPField -List "ARB Submissions" -DisplayName "Decision" -InternalName "Decision" -Type Choice -Choices "Approved","Conditional Approval","Rejected","Pending"
Add-PnPField -List "ARB Submissions" -DisplayName "Decision Notes" -InternalName "DecisionNotes" -Type Note
```

### Technical Reviews List
```powershell
New-PnPList -Title "Technical Reviews" -Template GenericList -Url "Lists/TechnicalReviews"

Add-PnPField -List "Technical Reviews" -DisplayName "Submission ID" -InternalName "SubmissionIDRef" -Type Text -Required
Add-PnPField -List "Technical Reviews" -DisplayName "Reviewer Name" -InternalName "ReviewerName" -Type User -Required
Add-PnPField -List "Technical Reviews" -DisplayName "Review Date" -InternalName "ReviewDate" -Type DateTime
Add-PnPField -List "Technical Reviews" -DisplayName "Architecture Alignment" -InternalName "ArchitectureAlignment" -Type Choice -Choices "Pass","Fail","Conditional"
Add-PnPField -List "Technical Reviews" -DisplayName "Scalability" -InternalName "Scalability" -Type Choice -Choices "Pass","Fail","Conditional"
Add-PnPField -List "Technical Reviews" -DisplayName "Performance" -InternalName "Performance" -Type Choice -Choices "Pass","Fail","Conditional"
Add-PnPField -List "Technical Reviews" -DisplayName "Maintainability" -InternalName "Maintainability" -Type Choice -Choices "Pass","Fail","Conditional"
Add-PnPField -List "Technical Reviews" -DisplayName "Technical Risk" -InternalName "TechnicalRisk" -Type Choice -Choices "Low","Medium","High","Critical"
Add-PnPField -List "Technical Reviews" -DisplayName "Overall Recommendation" -InternalName "OverallRecommendation" -Type Choice -Choices "Approve","Conditional Approval","Reject"
Add-PnPField -List "Technical Reviews" -DisplayName "Comments" -InternalName "TechReviewComments" -Type Note
```

### Security Reviews List
```powershell
New-PnPList -Title "Security Reviews" -Template GenericList -Url "Lists/SecurityReviews"

Add-PnPField -List "Security Reviews" -DisplayName "Submission ID" -InternalName "SubmissionIDRef" -Type Text -Required
Add-PnPField -List "Security Reviews" -DisplayName "Reviewer Name" -InternalName "SecurityReviewerName" -Type User -Required
Add-PnPField -List "Security Reviews" -DisplayName "Review Date" -InternalName "SecurityReviewDate" -Type DateTime
Add-PnPField -List "Security Reviews" -DisplayName "Authentication" -InternalName "Authentication" -Type Choice -Choices "Pass","Fail","Conditional"
Add-PnPField -List "Security Reviews" -DisplayName "Authorization" -InternalName "Authorization" -Type Choice -Choices "Pass","Fail","Conditional"
Add-PnPField -List "Security Reviews" -DisplayName "Data Protection" -InternalName "DataProtection" -Type Choice -Choices "Pass","Fail","Conditional"
Add-PnPField -List "Security Reviews" -DisplayName "Compliance" -InternalName "Compliance" -Type Choice -Choices "Pass","Fail","Conditional"
Add-PnPField -List "Security Reviews" -DisplayName "Risk Level" -InternalName "SecurityRiskLevel" -Type Choice -Choices "Low","Medium","High","Critical"
Add-PnPField -List "Security Reviews" -DisplayName "Overall Recommendation" -InternalName "SecurityRecommendation" -Type Choice -Choices "Approve","Conditional Approval","Reject"
Add-PnPField -List "Security Reviews" -DisplayName "Security Comments" -InternalName "SecurityComments" -Type Note
```

## Step 3: Create Document Libraries

### Submissions Library
```powershell
# Create library
New-PnPList -Title "ARB Submission Documents" -Template DocumentLibrary -Url "ARBSubmissionDocs"

# Add metadata columns
Add-PnPField -List "ARB Submission Documents" -DisplayName "Submission ID" -InternalName "DocSubmissionID" -Type Text
Add-PnPField -List "ARB Submission Documents" -DisplayName "Document Type" -InternalName "DocumentType" -Type Choice -Choices "Architecture Diagram","Technical Specification","Cost Analysis","Risk Assessment","Security Assessment","Other"
Add-PnPField -List "ARB Submission Documents" -DisplayName "Version" -InternalName "DocumentVersion" -Type Text
```

### Templates Library
```powershell
New-PnPList -Title "ARB Templates" -Template DocumentLibrary -Url "ARBTemplates"

Add-PnPField -List "ARB Templates" -DisplayName "Template Type" -InternalName "TemplateType" -Type Choice -Choices "Submission","Technical Review","Security Review","Approval","Gatekeeper"
Add-PnPField -List "ARB Templates" -DisplayName "Template Category" -InternalName "TemplateCategory" -Type Text
```

### Board Decisions Library
```powershell
New-PnPList -Title "Board Decisions" -Template DocumentLibrary -Url "BoardDecisions"

Add-PnPField -List "Board Decisions" -DisplayName "Submission ID" -InternalName "DecisionSubmissionID" -Type Text
Add-PnPField -List "Board Decisions" -DisplayName "Decision Date" -InternalName "DecisionDateLib" -Type DateTime
Add-PnPField -List "Board Decisions" -DisplayName "Decision Type" -InternalName "DecisionType" -Type Choice -Choices "Approved","Conditional Approval","Rejected"
```

## Step 4: Configure Permissions

### Create SharePoint Groups:
```powershell
# ARB Submitters
New-PnPGroup -Title "ARB Submitters" -Description "Users who can submit ARB requests"

# ARB Gatekeepers
New-PnPGroup -Title "ARB Gatekeepers" -Description "Users who perform intake review"

# ARB Technical Reviewers
New-PnPGroup -Title "ARB Technical Reviewers" -Description "Technical review team"

# ARB Security Reviewers
New-PnPGroup -Title "ARB Security Reviewers" -Description "Security review team"

# ARB Board Members
New-PnPGroup -Title "ARB Board Members" -Description "ARB board voting members"

# ARB Administrators
New-PnPGroup -Title "ARB Administrators" -Description "ARB system administrators"
```

### Assign Permissions:
```powershell
# Set unique permissions for lists
Set-PnPList -Identity "ARB Submissions" -BreakRoleInheritance

# Grant permissions
Set-PnPListPermission -Identity "ARB Submissions" -Group "ARB Submitters" -AddRole "Contribute"
Set-PnPListPermission -Identity "ARB Submissions" -Group "ARB Gatekeepers" -AddRole "Edit"
Set-PnPListPermission -Identity "ARB Submissions" -Group "ARB Board Members" -AddRole "Read"
Set-PnPListPermission -Identity "ARB Submissions" -Group "ARB Administrators" -AddRole "Full Control"
```

## Step 5: Create Site Pages

### Home Page Setup:
1. Navigate to Site Contents > Site Pages
2. Create new page: "ARB Home"
3. Add web parts:
   - Hero web part (Welcome message)
   - Quick Links (Submit Request, View My Submissions, Dashboards)
   - News web part (ARB announcements)
   - People web part (ARB board members)

### Dashboards Page:
1. Create page: "ARB Dashboards"
2. Add Power BI web parts
3. Embed reports (configured later)

### Help Page:
1. Create page: "Help and Resources"
2. Add documentation links
3. Add FAQ section
4. Add contact information

## Step 6: Configure Navigation

```powershell
# Add navigation nodes
Add-PnPNavigationNode -Location TopNavigationBar -Title "Home" -Url "/sites/ARB"
Add-PnPNavigationNode -Location TopNavigationBar -Title "Submit Request" -Url "/sites/ARB/Lists/ARBSubmissions/NewForm.aspx"
Add-PnPNavigationNode -Location TopNavigationBar -Title "My Submissions" -Url "/sites/ARB/Lists/ARBSubmissions/MyItems.aspx"
Add-PnPNavigationNode -Location TopNavigationBar -Title "Dashboards" -Url "/sites/ARB/SitePages/Dashboards.aspx"
Add-PnPNavigationNode -Location TopNavigationBar -Title "Templates" -Url "/sites/ARB/ARBTemplates"
Add-PnPNavigationNode -Location TopNavigationBar -Title "Help" -Url "/sites/ARB/SitePages/Help.aspx"
```

## Step 7: Enable Site Features

```powershell
# Enable required features
Enable-PnPFeature -Identity "00bfea71-e717-4e80-aa17-d0c71b360101" -Scope Site # Team Collaboration Lists
Enable-PnPFeature -Identity "94c94ca6-b32f-4da9-a9e3-1f3d343d7ecb" -Scope Site # Metadata Navigation
```

## Step 8: Upload Templates

Upload all template files from the repository to the ARB Templates library:
- Submission templates
- Review templates
- Decision letter templates

## Step 9: Configure List Views

### ARB Submissions Views:
```powershell
# All Active Submissions
Add-PnPView -List "ARB Submissions" -Title "Active Submissions" -Fields "SubmissionID","ProjectName","Status","Priority","SubmissionDate" -Query "<Where><Neq><FieldRef Name='Status'/><Value Type='Choice'>Approved</Value></Neq></Where>"

# My Submissions
Add-PnPView -List "ARB Submissions" -Title "My Submissions" -Fields "SubmissionID","ProjectName","Status","Priority","SubmissionDate" -Query "<Where><Eq><FieldRef Name='SubmitterEmail'/><Value Type='Text'>[Me]</Value></Eq></Where>" -PersonalView

# Pending Reviews
Add-PnPView -List "ARB Submissions" -Title "Pending Reviews" -Fields "SubmissionID","ProjectName","Status","Priority","SubmissionDate" -Query "<Where><Or><Eq><FieldRef Name='Status'/><Value Type='Choice'>In Technical Review</Value></Eq><Eq><FieldRef Name='Status'/><Value Type='Choice'>In Security Review</Value></Eq></Or></Where>"

# Board Review Queue
Add-PnPView -List "ARB Submissions" -Title "Board Review Queue" -Fields "SubmissionID","ProjectName","Priority","SubmissionDate","TechnicalReviewer","SecurityReviewer" -Query "<Where><Eq><FieldRef Name='Status'/><Value Type='Choice'>In Board Review</Value></Eq></Where>"
```

## Step 10: Testing

1. Create test submission
2. Verify permissions for each role
3. Test list views
4. Verify document upload functionality
5. Check navigation links
6. Validate search functionality

## Maintenance

### Regular Tasks:
- Review and update permissions quarterly
- Archive old submissions annually
- Update templates as processes change
- Monitor storage quota
- Review audit logs monthly

### Backup:
- Enable version history on all libraries
- Configure retention policies
- Export list data monthly
- Document site customizations

## Troubleshooting

### Common Issues:

**Issue**: Users cannot see submissions  
**Solution**: Check SharePoint group membership and list permissions

**Issue**: Forms not loading  
**Solution**: Verify Microsoft Forms integration and browser compatibility

**Issue**: Power Automate flows not triggering  
**Solution**: Check flow connections and SharePoint permissions

## Next Steps

1. [Deploy Power Automate Flows](power-automate-deployment.md)
2. [Configure Power BI Dashboards](power-bi-setup.md)
3. [Set up Microsoft Forms](forms-configuration.md)

## Support Resources

- SharePoint Admin Center: https://admin.microsoft.com/sharepoint
- PnP PowerShell Documentation: https://pnp.github.io/powershell/
- Microsoft 365 Support: https://support.microsoft.com

## Reference Scripts

All PowerShell scripts referenced in this guide are available in:
`/sharepoint/site-structure/deployment-scripts/`
