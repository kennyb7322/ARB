# Quick Start Guide - ARB SharePoint Template

## 5-Minute Setup Overview

This guide will help you get the ARB SharePoint template up and running quickly.

## What You'll Get

- ✅ Complete SharePoint site with ARB governance structure
- ✅ Automated workflows for review and compliance
- ✅ Executive dashboards for tracking and analytics
- ✅ Support for TOGAF, ITIL, NIST, FedRAMP, CIST, and CIJISA frameworks

## Prerequisites Checklist

Before you begin, ensure you have:

- [ ] SharePoint Online site (or ability to create one)
- [ ] Site Collection Administrator permissions
- [ ] Power Automate license (included with most Microsoft 365 plans)
- [ ] Power BI Pro or Premium license
- [ ] PowerShell installed (for template deployment)

## Installation in 5 Steps

### Step 1: Create SharePoint Site (5 minutes)

1. Go to SharePoint Admin Center
2. Click "Active sites" > "Create"
3. Choose "Team site"
4. Name: "Architecture Review Board" (or your preferred name)
5. Click "Finish"

### Step 2: Install PnP PowerShell (2 minutes)

Open PowerShell as Administrator:

```powershell
Install-Module -Name PnP.PowerShell -Force
```

### Step 3: Deploy SharePoint Template (3 minutes)

```powershell
# Connect to your site
Connect-PnPOnline -Url "https://yourtenant.sharepoint.com/sites/ARB" -Interactive

# Apply the template
Invoke-PnPSiteTemplate -Path "SharePoint-ARB-Template.xml"
```

Wait for the deployment to complete (usually 2-3 minutes).

### Step 4: Configure Power Automate Flows (10 minutes)

1. Go to [Power Automate](https://flow.microsoft.com)
2. Click "My flows" > "Import" > "Import Package (Legacy)"
3. For each flow in `PowerAutomate-Flows/` folder:
   - Upload the JSON file
   - Click "Import"
   - Configure connections (SharePoint, Office 365, Teams)
   - Update these values:
     - `yourtenant.sharepoint.com/sites/ARB` → your site URL
     - `arb-members@yourdomain.com` → your ARB email distribution list
     - `ARB-Team-ID` → your Teams channel ID (optional)
   - Save and turn on the flow

### Step 5: Deploy Power BI Dashboard (10 minutes)

1. Open Power BI Desktop
2. Click "Get Data" > "More" > "SharePoint Online List"
3. Enter your site URL: `https://yourtenant.sharepoint.com/sites/ARB`
4. Select these lists:
   - ARB Review Requests
   - Compliance Tracking
   - Service Deployment Tracking
5. Click "Load"
6. Import the template: File > Import > Power BI template
7. Select `PowerBI-Templates/ARB-Dashboard-Template.json`
8. Publish to Power BI Service
9. Configure scheduled refresh (once daily recommended)

## First Use - Submit a Test Request

### Create Your First ARB Request

1. Navigate to your SharePoint site
2. Click "ARB Review Requests" in the navigation
3. Click "New"
4. Fill in the form:
   - **Title**: "Test Architecture Review"
   - **Architecture Domain**: Choose any
   - **TOGAF Phase**: "Phase A: Architecture Vision"
   - **Compliance Framework**: Select one or more
   - **Risk Level**: "Low"
   - **Architecture Description**: "This is a test submission"
   - **Architecture Owner**: Select yourself
5. Click "Save"

### Verify Automation Works

Within a few minutes, you should receive:
- ✉️ Email notification (if configured)
- 💬 Teams notification (if configured)
- 📊 Entry appears in Power BI dashboard

## Customization (Optional)

### Add Your Logo

1. Site Settings > Title, description, and logo
2. Upload your organization's logo

### Customize Navigation

1. Site Settings > Navigation
2. Add/remove/reorder links as needed

### Modify Email Templates

1. Edit the Power Automate flows
2. Find the "Send Email" actions
3. Customize the HTML body

### Add Custom Fields

1. Site Settings > Site columns
2. Create new columns
3. Add to "ARB Review Request" content type
4. Update Power Automate flows to include new fields

## Common Issues & Solutions

### Issue: Template deployment fails

**Solution**: Ensure you have Site Collection Administrator rights
```powershell
# Check your permissions
Get-PnPSiteCollectionAdmin
```

### Issue: Power Automate flows not triggering

**Solution**: 
1. Verify flows are turned "On"
2. Check SharePoint connection has proper permissions
3. Test by manually running the flow

### Issue: Power BI not refreshing

**Solution**:
1. Check data source credentials in Power BI Service
2. Verify SharePoint permissions
3. Configure scheduled refresh

### Issue: Can't find SharePoint lists

**Solution**: 
1. Verify template deployment completed successfully
2. Check Site Contents for the lists
3. Refresh your browser

## Next Steps

### For ARB Members
1. Review the **[ARB Process Guide](Documentation/ARB-PROCESS-GUIDE.md)**
2. Familiarize yourself with the review criteria
3. Set up your email rules for ARB notifications

### For Architecture Owners (Requesters)
1. Read the **[ARB Submission Checklist](Documentation/ARB-SUBMISSION-CHECKLIST.md)**
2. Review the **[Framework Implementation Guide](Documentation/FRAMEWORK-IMPLEMENTATION.md)**
3. Prepare your first real ARB submission

### For Administrators
1. Review the **[Deployment Guide](Documentation/DEPLOYMENT-GUIDE.md)** for advanced configuration
2. Set up user permissions and security groups
3. Configure compliance tracking for your frameworks
4. Schedule ARB member training

## Training Resources

### Quick Training Modules (15 minutes each)

1. **For Requesters**: How to submit an ARB request
2. **For ARB Members**: How to review and approve requests
3. **For Compliance Officers**: How to track compliance
4. **For Administrators**: Site maintenance and customization

### Documentation Library

- 📘 **[Deployment Guide](Documentation/DEPLOYMENT-GUIDE.md)** - Complete installation guide
- 📗 **[ARB Process Guide](Documentation/ARB-PROCESS-GUIDE.md)** - Governance processes
- 📕 **[Framework Implementation](Documentation/FRAMEWORK-IMPLEMENTATION.md)** - Framework details
- 📙 **[Submission Checklist](Documentation/ARB-SUBMISSION-CHECKLIST.md)** - Request guidelines

## Support

### Getting Help

1. Check the documentation in the `Documentation/` folder
2. Review the troubleshooting section above
3. Contact your SharePoint administrator
4. Review Microsoft documentation:
   - [SharePoint Online](https://docs.microsoft.com/sharepoint/)
   - [Power Automate](https://docs.microsoft.com/power-automate/)
   - [Power BI](https://docs.microsoft.com/power-bi/)

### Reporting Issues

If you encounter issues:
1. Check the error message
2. Review the relevant documentation
3. Create an issue in the repository with:
   - Description of the problem
   - Steps to reproduce
   - Error messages (if any)
   - Your environment details

## Best Practices

### Weekly Maintenance (15 minutes)
- Review new ARB requests
- Check compliance tracking status
- Monitor Power BI metrics
- Address any pending items

### Monthly Reviews (1 hour)
- Review ARB process effectiveness
- Update compliance mappings
- Check Power Automate flow runs
- Review Power BI usage

### Quarterly Reviews (2 hours)
- Major process updates
- Template version updates
- User training refresh
- Governance effectiveness assessment

## Success Metrics

Track these KPIs to measure ARB success:

- 📊 **Approval Rate**: Target 70-80%
- ⏱️ **Average Review Time**: Target < 5 business days
- ✅ **Compliance Rate**: Target > 95%
- 🔄 **Resubmission Rate**: Target < 20%
- 📈 **Architecture Alignment Score**: Target > 85%

Monitor these in your Power BI dashboard!

## What's Next?

Now that your ARB template is set up:

1. ✅ Configure your first real ARB request
2. ✅ Schedule ARB member kickoff meeting
3. ✅ Train architecture owners on the process
4. ✅ Set up regular ARB review meetings
5. ✅ Monitor and optimize the process

---

**Congratulations!** 🎉 Your ARB governance framework is now operational.

For detailed information, always refer to the comprehensive guides in the `Documentation/` folder.

**Questions?** Review the documentation or contact your SharePoint administrator.

---

**Document Version**: 1.0  
**Last Updated**: 2025
