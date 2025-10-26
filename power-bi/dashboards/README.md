# Power BI Dashboards README

## Overview
This directory contains Power BI dashboard templates for the Architecture Review Board (ARB) system.

## Available Dashboards

### 1. Executive Dashboard (ARB-Executive-Dashboard.pbix)
**Audience:** Executive leadership, ARB Chair  
**Refresh Schedule:** Daily  
**Purpose:** High-level view of ARB metrics and strategic alignment

**Key Visualizations:**
- Total Submissions (YTD, MTD, WTD)
- Approval Rate Trend
- Average Cycle Time
- SLA Compliance Rate
- Submissions by Status (Donut Chart)
- Submissions by Type (Bar Chart)
- Top 10 Projects by Cost (Table)
- Monthly Submission Trend (Line Chart)

### 2. Operational Dashboard (ARB-Operational-Dashboard.pbix)
**Audience:** ARB administrators, gatekeepers  
**Refresh Schedule:** Hourly  
**Purpose:** Day-to-day operations management

**Key Visualizations:**
- Active Items by Status (Cards)
- Reviewer Workload (Clustered Bar)
- Days in Current Stage (Histogram)
- SLA Compliance by Stage (Stacked Bar)
- Overdue Items (Table with drill-down)
- Processing Time by Stage (Waterfall Chart)

### 3. Reviewer Dashboard (ARB-Reviewer-Dashboard.pbix)
**Audience:** Technical and security reviewers  
**Refresh Schedule:** Real-time/Hourly  
**Purpose:** Personal workload management

**Key Visualizations:**
- My Active Reviews (Card)
- My Review Queue (Table with links)
- My Completion Rate (Gauge)
- My Average Review Time (Card)
- Reviews by Month (Column Chart)
- Review Outcomes Distribution (Pie Chart)

### 4. Compliance Dashboard (ARB-Compliance-Dashboard.pbix)
**Audience:** Compliance officers, auditors  
**Refresh Schedule:** Daily  
**Purpose:** Security and compliance tracking

**Key Visualizations:**
- Security Pass Rate (Card)
- Policy Adherence (Card)
- Risk Distribution (Treemap)
- Security Outcomes by Area (Stacked Column)
- Compliance Checklist Matrix
- Security Trends Over Time (Line Chart)

## Data Sources

All dashboards connect to:
- **SharePoint Lists:**
  - ARB Submissions (Primary)
  - Technical Reviews
  - Security Reviews
  - Board Decisions

## Setup Instructions

### Prerequisites
1. Power BI Desktop installed
2. Power BI Pro or Premium license
3. Access to ARB SharePoint site
4. Permissions to publish to Power BI workspace

### Installation Steps

1. **Download PBIX Files**
   - Download the dashboard templates from this directory

2. **Open in Power BI Desktop**
   - Open the .pbix file in Power BI Desktop

3. **Update Data Source**
   - Click "Transform Data" > "Data Source Settings"
   - Update SharePoint site URL to your ARB site
   - Enter credentials when prompted

4. **Refresh Data**
   - Click "Refresh" to load data
   - Verify visualizations populate correctly

5. **Publish to Service**
   - Click "Publish" in the ribbon
   - Select your Power BI workspace
   - Wait for publish to complete

6. **Configure Scheduled Refresh**
   - Go to PowerBI.com
   - Navigate to your workspace
   - Click "..." on the dataset
   - Select "Settings" > "Scheduled refresh"
   - Configure refresh schedule

7. **Embed in SharePoint**
   - Get the report URL from PowerBI.com
   - Create SharePoint page in ARB site
   - Add Power BI web part
   - Configure with report URL

## Row-Level Security (RLS)

### Reviewer Role
```DAX
[ReviewerEmail] = USERPRINCIPALNAME()
```
Reviewers see only their assigned items.

### Board Member Role
```DAX
'Users'[Role] = "Board Member"
```
Board members see all submissions.

### Applying RLS
1. In Power BI Desktop: Modeling > Manage Roles
2. Create roles and define DAX filters
3. Test using "View as Role"
4. Publish to service
5. In PowerBI.com: Dataset Settings > Security
6. Assign users/groups to roles

## Customization

### Adding Custom Visualizations
1. Open dashboard in Power BI Desktop
2. Click visualizations pane
3. Add new visual to canvas
4. Configure data fields
5. Format as needed
6. Save and republish

### Modifying Calculations
1. Go to "Model" view
2. Edit existing measures or create new ones
3. Test calculations
4. Save and republish

### Changing Refresh Schedule
1. Go to dataset settings in PowerBI.com
2. Navigate to "Scheduled refresh"
3. Update frequency and times
4. Save changes

## Troubleshooting

### Data Not Refreshing
**Problem:** Dashboard shows old data  
**Solution:**
1. Check scheduled refresh status
2. Verify credentials are current
3. Check SharePoint permissions
4. Review refresh history for errors

### Visualizations Not Displaying
**Problem:** Charts show errors or no data  
**Solution:**
1. Verify data source connection
2. Check field mappings
3. Review DAX formulas for errors
4. Ensure data types are correct

### Permission Issues
**Problem:** Users can't view dashboard  
**Solution:**
1. Verify user has Power BI license
2. Check workspace permissions
3. Verify RLS configuration
4. Ensure SharePoint permissions

### Performance Issues
**Problem:** Dashboard loads slowly  
**Solution:**
1. Use Import mode instead of DirectQuery
2. Reduce number of visuals per page
3. Optimize DAX calculations
4. Implement incremental refresh
5. Use aggregation tables

## Best Practices

### Design
- Keep visualizations simple and focused
- Use consistent color scheme
- Limit visuals to 20 per page
- Include filters and slicers
- Provide context with titles and labels

### Performance
- Use Import mode when possible
- Implement incremental refresh for large datasets
- Optimize DAX calculations with variables
- Remove unnecessary columns
- Use aggregation tables

### Governance
- Document data sources and calculations
- Maintain change log for updates
- Test thoroughly before publishing
- Monitor usage and performance
- Gather user feedback regularly

## Maintenance

### Weekly
- Review refresh failures
- Check data accuracy
- Monitor performance metrics

### Monthly
- Review usage analytics
- Gather user feedback
- Update visualizations as needed
- Optimize slow queries

### Quarterly
- Full data model review
- Performance tuning
- Feature enhancements
- User training sessions

## Support

**For Dashboard Issues:**
- Email: arb-powerbi@agency.gov
- Teams: Power BI Support Channel

**For Data Issues:**
- Email: arb-admin@agency.gov
- Teams: ARB Help Desk

**For Access Issues:**
- Email: arb-access@agency.gov
- Self-service: PowerBI.com workspace access request

## Resources

- [Power BI Documentation](https://docs.microsoft.com/power-bi/)
- [DAX Guide](https://dax.guide/)
- [Power BI Community](https://community.powerbi.com/)
- ARB Power BI Setup Guide: `/docs/guides/power-bi-setup.md`

## Version History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | 2024-01-01 | Initial dashboards created | ARB Administrator |

---

**Note:** PBIX files are not included in this repository due to size. They should be created using the setup guide and stored in your organization's Power BI workspace.

To create the dashboard files:
1. Follow the setup guide in `/docs/guides/power-bi-setup.md`
2. Use the DAX formulas and data model definitions provided
3. Build visualizations as described
4. Save PBIX files to this directory (for backup purposes)
5. Publish to Power BI Service for production use
