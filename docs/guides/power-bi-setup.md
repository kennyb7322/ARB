# Power BI Dashboard Setup Guide

## Overview
This guide covers the setup and configuration of Power BI dashboards for the Architecture Review Board (ARB) system.

## Prerequisites
- Power BI Pro or Premium license
- Access to SharePoint ARB site
- Power BI Desktop installed
- Appropriate permissions to publish reports

## Dashboard Architecture

### Executive Dashboard
**Audience**: Executive leadership, ARB Chair  
**Refresh**: Daily  
**Key Metrics**:
- Total submissions (YTD, MTD, WTD)
- Approval rate
- Average cycle time
- Current backlog
- SLA compliance rate
- Cost impact of approved projects

### Operational Dashboard
**Audience**: ARB administrators, gatekeepers  
**Refresh**: Hourly  
**Key Metrics**:
- Submissions by status
- Items pending review
- Reviewer workload
- SLA violations
- Bottleneck analysis
- Processing time by stage

### Reviewer Dashboard
**Audience**: Technical and security reviewers  
**Refresh**: Real-time (when possible)  
**Key Metrics**:
- My assigned reviews
- Review deadlines
- Completion rate
- Average review time
- Historical review volume

### Compliance Dashboard
**Audience**: Compliance officers, auditors  
**Refresh**: Daily  
**Key Metrics**:
- Security review outcomes
- Compliance violations
- Risk assessment trends
- Audit trail summary
- Policy adherence

## Data Model

### Data Sources

```
SharePoint Lists:
├── ARB Submissions (Primary fact table)
├── Technical Reviews (Related table)
├── Security Reviews (Related table)
└── Board Decisions (Related table)

Reference Data:
├── Date Calendar (Generated)
├── Users (Office 365)
├── Business Units (Static)
└── Project Types (Static)
```

### Relationships

```
ARB Submissions [SubmissionID] ──< Technical Reviews [SubmissionIDRef]
ARB Submissions [SubmissionID] ──< Security Reviews [SubmissionIDRef]
ARB Submissions [SubmissionID] ──< Board Decisions [DecisionSubmissionID]
ARB Submissions [SubmissionDate] >── Date Calendar [Date]
```

### Calculated Columns

```DAX
// Days in Current Stage
DaysInStage = 
DATEDIFF(
    'ARB Submissions'[Modified],
    TODAY(),
    DAY
)

// SLA Status
SLAStatus = 
SWITCH(
    TRUE(),
    'ARB Submissions'[Status] = "In Intake Review" && 'ARB Submissions'[DaysInStage] > 3, "Breached",
    'ARB Submissions'[Status] = "In Technical Review" && 'ARB Submissions'[DaysInStage] > 7, "Breached",
    'ARB Submissions'[Status] = "In Security Review" && 'ARB Submissions'[DaysInStage] > 7, "Breached",
    'ARB Submissions'[Status] = "In Board Review" && 'ARB Submissions'[DaysInStage] > 10, "Breached",
    'ARB Submissions'[DaysInStage] > ('ARB Submissions'[SLAThreshold] * 0.8), "At Risk",
    "On Track"
)

// Cycle Time
CycleTime = 
DATEDIFF(
    'ARB Submissions'[SubmissionDate],
    'ARB Submissions'[BoardDecisionDate],
    DAY
)

// Fiscal Quarter
FiscalQuarter = 
"FY" & YEAR('ARB Submissions'[SubmissionDate]) & " Q" & 
ROUNDUP(MONTH('ARB Submissions'[SubmissionDate])/3, 0)

// Priority Score
PriorityScore = 
SWITCH(
    'ARB Submissions'[Priority],
    "Critical", 4,
    "High", 3,
    "Medium", 2,
    "Low", 1,
    0
)
```

### Measures

```DAX
// Total Submissions
Total Submissions = COUNTROWS('ARB Submissions')

// Active Submissions
Active Submissions = 
CALCULATE(
    COUNTROWS('ARB Submissions'),
    'ARB Submissions'[Status] <> "Approved",
    'ARB Submissions'[Status] <> "Rejected"
)

// Approval Rate
Approval Rate = 
DIVIDE(
    CALCULATE(COUNTROWS('ARB Submissions'), 'ARB Submissions'[Decision] = "Approved"),
    CALCULATE(COUNTROWS('ARB Submissions'), 'ARB Submissions'[Decision] <> BLANK()),
    0
)

// Average Cycle Time
Avg Cycle Time = 
AVERAGE('ARB Submissions'[CycleTime])

// SLA Compliance Rate
SLA Compliance Rate = 
DIVIDE(
    CALCULATE(COUNTROWS('ARB Submissions'), 'ARB Submissions'[SLAStatus] = "On Track"),
    COUNTROWS('ARB Submissions'),
    0
)

// Backlog Count
Backlog = 
CALCULATE(
    COUNTROWS('ARB Submissions'),
    'ARB Submissions'[Status] IN {
        "In Intake Review",
        "In Technical Review",
        "In Security Review",
        "In Board Review"
    }
)

// Total Estimated Value
Total Estimated Value = SUM('ARB Submissions'[EstimatedCost])

// Submissions by Status
Submissions by Status = 
CALCULATE(
    COUNTROWS('ARB Submissions'),
    ALLEXCEPT('ARB Submissions', 'ARB Submissions'[Status])
)

// MTD Submissions
MTD Submissions = 
CALCULATE(
    COUNTROWS('ARB Submissions'),
    DATESMTD('Date Calendar'[Date])
)

// YTD Submissions
YTD Submissions = 
CALCULATE(
    COUNTROWS('ARB Submissions'),
    DATESYTD('Date Calendar'[Date])
)

// Average Days in Stage
Avg Days in Stage = 
AVERAGE('ARB Submissions'[DaysInStage])

// Overdue Items
Overdue Items = 
CALCULATE(
    COUNTROWS('ARB Submissions'),
    'ARB Submissions'[SLAStatus] = "Breached"
)
```

## Dashboard 1: Executive Dashboard

### Page Layout

**Top Banner (KPIs)**
```
┌─────────────┬─────────────┬─────────────┬─────────────┐
│ Total       │ Approval    │ Avg Cycle   │ SLA         │
│ Submissions │ Rate        │ Time        │ Compliance  │
│ 847         │ 78%         │ 24 days     │ 92%         │
└─────────────┴─────────────┴─────────────┴─────────────┘
```

**Trend Charts**
```
┌───────────────────────────┬───────────────────────────┐
│ Submissions Trend (Line)  │ Approval Rate Trend       │
│                           │ (Line + Column)           │
│ Monthly volume over time  │ Approved vs Rejected      │
└───────────────────────────┴───────────────────────────┘
```

**Status & Type Breakdown**
```
┌───────────────────────────┬───────────────────────────┐
│ Submissions by Status     │ Submissions by Type       │
│ (Donut Chart)             │ (Bar Chart)               │
│                           │                           │
└───────────────────────────┴───────────────────────────┘
```

**Bottom Section**
```
┌─────────────────────────────────────────────────────────┐
│ Top 10 Projects by Estimated Cost (Table)               │
│ Project | Type | Cost | Status | Decision               │
└─────────────────────────────────────────────────────────┘
```

### Filters/Slicers
- Date Range (Last 30/60/90 days, YTD, Custom)
- Business Unit
- Project Type
- Priority
- Status

## Dashboard 2: Operational Dashboard

### Page Layout

**Status Overview**
```
┌──────────┬──────────┬──────────┬──────────┬──────────┐
│ Intake   │ Tech     │ Security │ Board    │ Backlog  │
│ Review   │ Review   │ Review   │ Review   │ Total    │
│ 12       │ 23       │ 18       │ 8        │ 61       │
└──────────┴──────────┴──────────┴──────────┴──────────┘
```

**Workload Analysis**
```
┌───────────────────────────┬───────────────────────────┐
│ Reviewer Workload         │ Days in Current Stage     │
│ (Clustered Bar)           │ (Histogram)               │
│ By reviewer name          │ Distribution              │
└───────────────────────────┴───────────────────────────┘
```

**SLA Tracking**
```
┌───────────────────────────┬───────────────────────────┐
│ SLA Compliance by Stage   │ Overdue Items             │
│ (Stacked Bar)             │ (Table with drill-down)   │
│ On Track / At Risk /      │ Critical items first      │
│ Breached                  │                           │
└───────────────────────────┴───────────────────────────┘
```

**Processing Time Analysis**
```
┌─────────────────────────────────────────────────────────┐
│ Average Processing Time by Stage (Waterfall Chart)      │
│ Intake → Tech → Security → Board → Total                │
└─────────────────────────────────────────────────────────┘
```

### Filters/Slicers
- Status
- Priority
- Assigned Reviewer
- SLA Status
- Date Range

## Dashboard 3: Reviewer Dashboard

### Page Layout

**My Workload**
```
┌──────────────────────────────────────────────────────────┐
│ My Active Reviews (Card Visual)                          │
│ 5 items assigned to me                                   │
└──────────────────────────────────────────────────────────┘
```

**Review Queue**
```
┌─────────────────────────────────────────────────────────┐
│ My Review Queue (Table)                                 │
│ Submission | Project | Type | Due Date | Days Left      │
│ [Click to open in SharePoint]                           │
└─────────────────────────────────────────────────────────┘
```

**Performance Metrics**
```
┌───────────────────────────┬───────────────────────────┐
│ My Completion Rate        │ My Avg Review Time        │
│ (Gauge)                   │ (Card)                    │
│ 95% on-time               │ 4.2 days                  │
└───────────────────────────┴───────────────────────────┘
```

**Historical Analysis**
```
┌───────────────────────────┬───────────────────────────┐
│ Reviews by Month          │ Review Outcomes           │
│ (Column Chart)            │ (Pie Chart)               │
│ Volume trend              │ Approve/Conditional/      │
│                           │ Reject distribution       │
└───────────────────────────┴───────────────────────────┘
```

### Row-Level Security (RLS)

```DAX
// Reviewer sees only their assigned items
[ReviewerEmail] = USERPRINCIPALNAME()

// Gatekeeper sees items in their business unit
[BusinessUnit] = LOOKUPVALUE(
    'Users'[BusinessUnit],
    'Users'[Email], USERPRINCIPALNAME()
)

// Board members see everything
OR(
    'Users'[Role] = "Board Member",
    'Users'[Role] = "Administrator"
)
```

## Dashboard 4: Compliance Dashboard

### Page Layout

**Compliance KPIs**
```
┌─────────────┬─────────────┬─────────────┬─────────────┐
│ Security    │ Policy      │ Risk        │ Audit       │
│ Pass Rate   │ Adherence   │ Level Avg   │ Findings    │
│ 96%         │ 100%        │ Medium      │ 3           │
└─────────────┴─────────────┴─────────────┴─────────────┘
```

**Security Review Analysis**
```
┌───────────────────────────┬───────────────────────────┐
│ Security Outcomes         │ Risk Distribution         │
│ (Stacked Column)          │ (Treemap)                 │
│ By security area          │ Low/Medium/High/Critical  │
└───────────────────────────┴───────────────────────────┘
```

**Compliance Tracking**
```
┌─────────────────────────────────────────────────────────┐
│ Compliance Checklist Completion (Matrix)                │
│ Project vs. Compliance Requirement                      │
└─────────────────────────────────────────────────────────┘
```

**Trend Analysis**
```
┌─────────────────────────────────────────────────────────┐
│ Security Review Trends Over Time (Line Chart)           │
│ Pass/Conditional/Fail rates by month                    │
└─────────────────────────────────────────────────────────┘
```

## Setup Instructions

### Step 1: Create Data Connection

1. Open Power BI Desktop
2. Get Data > SharePoint Online List
3. Enter SharePoint site URL: `https://yourtenant.sharepoint.com/sites/ARB`
4. Select lists:
   - ARB Submissions
   - Technical Reviews
   - Security Reviews
   - Board Decisions
5. Click Transform Data

### Step 2: Data Transformation (Power Query)

```M
// ARB Submissions transformations
let
    Source = SharePoint.Tables("https://yourtenant.sharepoint.com/sites/ARB"),
    ARBSubmissions = Source{[Name="ARB Submissions"]}[Items],
    
    // Remove system columns
    RemovedColumns = Table.RemoveColumns(ARBSubmissions,{"Attachments", "ContentType", "Edit"}),
    
    // Change data types
    ChangedTypes = Table.TransformColumnTypes(RemovedColumns,{
        {"SubmissionDate", type date},
        {"BoardDecisionDate", type date},
        {"EstimatedCost", Currency.Type},
        {"ProposedStartDate", type date}
    }),
    
    // Add calculated columns
    AddedCycleTime = Table.AddColumn(ChangedTypes, "CycleTime", 
        each Duration.Days([BoardDecisionDate] - [SubmissionDate])),
    
    AddedDaysInStage = Table.AddColumn(AddedCycleTime, "DaysInStage",
        each Duration.Days(DateTime.LocalNow() - [Modified]))
in
    AddedDaysInStage
```

### Step 3: Create Date Calendar

```DAX
Date Calendar = 
ADDCOLUMNS(
    CALENDAR(DATE(2020,1,1), DATE(2030,12,31)),
    "Year", YEAR([Date]),
    "Quarter", "Q" & FORMAT([Date], "Q"),
    "Month", FORMAT([Date], "MMMM"),
    "MonthNumber", MONTH([Date]),
    "Week", WEEKNUM([Date]),
    "DayOfWeek", FORMAT([Date], "dddd"),
    "FiscalYear", "FY" & IF(MONTH([Date]) >= 10, YEAR([Date]) + 1, YEAR([Date])),
    "FiscalQuarter", "FY" & IF(MONTH([Date]) >= 10, YEAR([Date]) + 1, YEAR([Date])) & " Q" & ROUNDUP(MOD(MONTH([Date]) + 3, 12) / 3, 0)
)
```

### Step 4: Build Visualizations

Follow the layouts described above for each dashboard page.

### Step 5: Apply RLS (Row-Level Security)

1. Modeling tab > Manage Roles
2. Create roles:
   - Reviewer
   - Gatekeeper
   - Board Member
   - Administrator
3. Define DAX filters for each role
4. Test using "View as Role"

### Step 6: Publish to Power BI Service

1. File > Publish > Select workspace
2. Configure scheduled refresh
3. Set up data gateway (if on-premises)
4. Configure security groups

### Step 7: Embed in SharePoint

```html
<!-- Add Power BI web part to SharePoint page -->
<iframe 
    width="100%" 
    height="600" 
    src="https://app.powerbi.com/view?r=REPORT_ID" 
    frameborder="0" 
    allowFullScreen="true">
</iframe>
```

## Data Refresh Schedule

### Recommended Refresh Frequency:
- **Executive Dashboard**: Daily at 6 AM
- **Operational Dashboard**: Every 2 hours during business hours
- **Reviewer Dashboard**: Hourly during business hours
- **Compliance Dashboard**: Daily at 7 AM

### Configure Refresh (Power BI Service):
1. Navigate to workspace
2. Click "..." on dataset
3. Select "Settings"
4. Configure "Scheduled refresh"
5. Set credentials for data source
6. Define refresh times

## Performance Optimization

### Best Practices:
1. **Use DirectQuery** for real-time data (if needed)
2. **Import Mode** for better performance (recommended)
3. **Incremental Refresh** for large datasets
4. **Aggregate Tables** for common queries
5. **Optimize DAX** - use variables, avoid calculated columns when possible
6. **Limit Visuals** - max 20 per page
7. **Use Bookmarks** for drill-through pages

### Incremental Refresh Setup:
```
Filter: SubmissionDate >= RangeStart AND SubmissionDate < RangeEnd
Archive: Keep data from last 3 years
Refresh: Last 90 days only
```

## Monitoring and Maintenance

### Weekly Tasks:
- Review refresh failures
- Check data accuracy
- Monitor performance metrics
- Update calculated measures if needed

### Monthly Tasks:
- Review usage analytics
- Gather user feedback
- Optimize slow reports
- Update visualizations

### Quarterly Tasks:
- Full data model review
- Performance tuning
- Feature enhancements
- Training sessions

## Troubleshooting

### Common Issues:

**Issue**: Data not refreshing  
**Solution**: Check credentials, gateway status, SharePoint permissions

**Issue**: Slow report performance  
**Solution**: Reduce visuals, optimize DAX, use aggregations

**Issue**: Incorrect calculations  
**Solution**: Verify relationships, check filter context, review DAX

**Issue**: RLS not working  
**Solution**: Test role definitions, check user assignments in service

## Additional Resources

### Dashboard Templates:
- Executive Dashboard PBIX: `/power-bi/dashboards/ARB-Executive-Dashboard.pbix`
- Operational Dashboard PBIX: `/power-bi/dashboards/ARB-Operational-Dashboard.pbix`
- Reviewer Dashboard PBIX: `/power-bi/dashboards/ARB-Reviewer-Dashboard.pbix`
- Compliance Dashboard PBIX: `/power-bi/dashboards/ARB-Compliance-Dashboard.pbix`

### Sample Data:
- Sample dataset: `/power-bi/datasets/sample-arb-data.xlsx`
- Data model diagram: `/power-bi/datasets/data-model-diagram.png`

### External Resources:
- Power BI Documentation: https://docs.microsoft.com/power-bi/
- DAX Guide: https://dax.guide/
- Power BI Community: https://community.powerbi.com/

## Next Steps

1. Download and install PBIX templates
2. Configure data connections
3. Publish to Power BI workspace
4. Embed in SharePoint site
5. Train users on dashboard usage
6. Set up monitoring and alerts
