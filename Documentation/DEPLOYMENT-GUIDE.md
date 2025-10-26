# Architecture Review Board (ARB) SharePoint Template

## Overview

This SharePoint template provides a comprehensive Architecture Review Board (ARB) governance framework aligned with multiple industry-standard frameworks and compliance requirements.

## Supported Frameworks

### 1. TOGAF (The Open Group Architecture Framework)
The template implements the TOGAF Architecture Development Method (ADM) with tracking for all 9 phases:
- **Preliminary Phase**: Framework and principles establishment
- **Phase A**: Architecture Vision
- **Phase B**: Business Architecture
- **Phase C**: Information Systems Architecture (Data & Application)
- **Phase D**: Technology Architecture
- **Phase E**: Opportunities and Solutions
- **Phase F**: Migration Planning
- **Phase G**: Implementation Governance
- **Phase H**: Architecture Change Management

### 2. ITIL v4 (IT Infrastructure Library)
Integration with ITIL v4 service management practices:
- Service Value System (SVS)
- Service Value Chain activities
- Continual Improvement approach
- Change enablement and control

### 3. NIST (National Institute of Standards and Technology)
Compliance tracking for:
- **NIST 800-53**: Security and Privacy Controls
- **NIST Cybersecurity Framework**: Identify, Protect, Detect, Respond, Recover
- Risk Management Framework (RMF)

### 4. FedRAMP (Federal Risk and Authorization Management Program)
Support for all FedRAMP impact levels:
- FedRAMP Low
- FedRAMP Moderate
- FedRAMP High

### 5. CIST (Cybersecurity Information Sharing and Threat)
Integration of cybersecurity information sharing protocols and threat intelligence management.

### 6. CIJISA (Criminal Intelligence and Justice Information Sharing Architecture)
Support for justice information sharing and criminal intelligence standards.

## Template Components

### SharePoint Site Structure

#### Lists and Libraries

1. **ARB Review Requests**
   - Tracks all architecture review submissions
   - Custom fields for domain, TOGAF phase, compliance frameworks, risk level
   - Automated workflow triggers

2. **Architecture Documentation**
   - Document library organized by architecture domain
   - Folders for each TOGAF ADM phase
   - Version control and approval workflows
   - Pre-configured folders:
     - Business Architecture
     - Data Architecture
     - Application Architecture
     - Technology Architecture
     - Security Architecture
     - TOGAF ADM Documents
     - Compliance Documents

3. **Compliance Tracking**
   - Monitor compliance across all frameworks
   - Track control implementation status
   - Assessment dates and findings

4. **Service Deployment Tracking**
   - Track services through deployment lifecycle
   - Link to ARB approvals
   - Service ownership and stages

### Power Automate Workflows

#### ARB Review Workflow
Automates the review process:
1. **Trigger**: New ARB request submitted
2. **Actions**:
   - Send email notification to ARB members
   - Post to Microsoft Teams channel
   - Update status to "In Review"
   - Create compliance tracking entry
   - On approval: notify requester and create deployment tracking entry

#### Compliance Monitoring Workflow
Weekly automated compliance checks:
1. **Trigger**: Weekly schedule (Monday 9 AM)
2. **Actions**:
   - Retrieve all active services
   - Check associated compliance frameworks
   - Run framework-specific validations
   - Log compliance status
   - Send weekly report to ARB members

### Power BI Dashboard

The Power BI template includes four comprehensive dashboards:

#### 1. ARB Overview Dashboard
- Total requests and approval rate
- High-risk item tracking
- Request distribution by status and domain
- Trend analysis over time

#### 2. TOGAF ADM Tracking Dashboard
- Phase distribution funnel
- Phase completion gauges
- Architecture vision progress
- Detailed phase breakdown table

#### 3. Compliance Dashboard
- Overall compliance rate
- Framework-specific compliance metrics
- NIST 800-53 control tracking
- FedRAMP control tracking
- Compliance status matrix

#### 4. Service Deployment Dashboard
- Active service count
- Deployment pipeline funnel
- Service stage tracking
- Deployment timeline

## Installation Instructions

### Prerequisites
- SharePoint Online site
- Power Automate license
- Power BI Pro or Premium license
- Site Collection Administrator permissions

### Step 1: Deploy SharePoint Template

1. Download the `SharePoint-ARB-Template.xml` file
2. Install PnP PowerShell module:
   ```powershell
   Install-Module -Name PnP.PowerShell
   ```
3. Connect to your SharePoint site:
   ```powershell
   Connect-PnPOnline -Url "https://yourtenant.sharepoint.com/sites/ARB" -Interactive
   ```
4. Apply the template:
   ```powershell
   Invoke-PnPSiteTemplate -Path "SharePoint-ARB-Template.xml"
   ```

### Step 2: Configure Power Automate Flows

1. Navigate to Power Automate (flow.microsoft.com)
2. Import the flow definitions from `PowerAutomate-Flows` folder
3. For each flow:
   - Click "Import"
   - Upload the JSON file
   - Configure SharePoint connections
   - Update site URLs to your tenant
   - Update email addresses and Teams channel IDs
   - Save and turn on the flow

### Step 3: Deploy Power BI Dashboard

1. Open Power BI Desktop
2. Import the template from `PowerBI-Templates/ARB-Dashboard-Template.json`
3. Update data source connections:
   - Click "Transform Data" > "Data Source Settings"
   - Update SharePoint site URL
   - Enter credentials
4. Publish to Power BI Service
5. Configure scheduled refresh
6. Share with ARB members

### Step 4: Embed Power BI in SharePoint

1. In SharePoint, create a page called "PowerBI-Dashboard"
2. Add Power BI web part
3. Select your published dashboard
4. Save and publish the page

## Usage Guidelines

### Submitting an ARB Request

1. Navigate to "ARB Review Requests" list
2. Click "New" to create a request
3. Fill in required fields:
   - Title: Clear, descriptive name
   - Architecture Domain: Select primary domain
   - TOGAF Phase: Current ADM phase
   - Compliance Framework: Select all applicable frameworks
   - Risk Level: Assess potential impact
   - Architecture Description: Detailed description
   - Architecture Owner: Assign owner
4. Save the item
5. Automated workflow will notify ARB members

### ARB Review Process

1. **Submission**: Requester creates ARB request
2. **Notification**: ARB members receive email and Teams notification
3. **Review**: ARB members review documentation
4. **Decision**: Update status to Approved/Rejected/Conditional/Deferred
5. **Approval**: On approval, service deployment tracking is created
6. **Implementation**: Follow TOGAF ADM phases

### Compliance Management

1. **Initial Assessment**: When ARB request is approved, compliance entries are created
2. **Ongoing Monitoring**: Weekly automated checks via Power Automate
3. **Manual Reviews**: Update compliance tracking list as needed
4. **Reporting**: Review Power BI compliance dashboard

### Service Deployment Lifecycle

1. **Planning**: Initial architecture approved
2. **Design**: Detailed design documents
3. **Development**: Implementation phase
4. **Testing**: QA and security testing
5. **Staging**: Pre-production validation
6. **Production**: Live deployment
7. **Retired**: End of service life

## Enterprise Architecture Governance

### TOGAF ADM Integration

The template supports the complete TOGAF ADM cycle:

1. **Preliminary Phase**: Establish architecture capability
   - Define architecture principles
   - Define architecture framework
   - Define stakeholder map

2. **Architecture Vision (Phase A)**: 
   - Create architecture vision document
   - Identify stakeholders
   - Define scope and constraints

3. **Business Architecture (Phase B)**:
   - Document business capabilities
   - Document business processes
   - Map to organizational structure

4. **Information Systems Architecture (Phase C)**:
   - Data architecture definitions
   - Application portfolio management
   - Integration architecture

5. **Technology Architecture (Phase D)**:
   - Technology standards and platforms
   - Infrastructure architecture
   - Deployment architecture

6. **Opportunities and Solutions (Phase E)**:
   - Identify solution options
   - Gap analysis
   - Define implementation approach

7. **Migration Planning (Phase F)**:
   - Migration roadmap
   - Implementation and migration plan

8. **Implementation Governance (Phase G)**:
   - Architectural compliance reviews
   - Dispense architectural guidance
   - Monitor implementation

9. **Architecture Change Management (Phase H)**:
   - Continuous monitoring
   - Change request management
   - Update architecture repository

### Compliance Framework Mapping

#### NIST 800-53 Control Families
- AC: Access Control
- AU: Audit and Accountability
- AT: Awareness and Training
- CM: Configuration Management
- CP: Contingency Planning
- IA: Identification and Authentication
- IR: Incident Response
- MA: Maintenance
- MP: Media Protection
- PS: Personnel Security
- PE: Physical and Environmental Protection
- PL: Planning
- PM: Program Management
- RA: Risk Assessment
- CA: Security Assessment and Authorization
- SC: System and Communications Protection
- SI: System and Information Integrity
- SA: System and Services Acquisition

#### FedRAMP Requirements
- **Low Impact**: Basic security controls
- **Moderate Impact**: Enhanced security controls (most common)
- **High Impact**: Maximum security controls for critical systems

#### ITIL v4 Service Value Chain
- Plan: Strategic planning and portfolio management
- Improve: Continual improvement practices
- Engage: Stakeholder engagement and feedback
- Design and Transition: Architecture and change enablement
- Obtain/Build: Supplier and development management
- Deliver and Support: Service delivery and support

## Customization

### Adding Custom Fields

1. Navigate to Site Settings > Site Columns
2. Create new columns as needed
3. Add to "ARB Content Types"
4. Update Power Automate flows to include new fields
5. Update Power BI data model

### Modifying Workflows

1. Edit flow in Power Automate
2. Add/modify actions
3. Test thoroughly before enabling
4. Document changes

### Extending Dashboards

1. Open Power BI Desktop
2. Add new visualizations
3. Create new measures/calculated columns
4. Publish updates to Power BI Service

## Best Practices

1. **Complete Documentation**: Ensure all architecture decisions are documented
2. **Regular Reviews**: Schedule periodic ARB meetings
3. **Compliance First**: Always validate against required frameworks
4. **Version Control**: Use SharePoint versioning for all documents
5. **Stakeholder Engagement**: Keep all stakeholders informed
6. **Continuous Improvement**: Regularly review and update processes
7. **Training**: Provide training for ARB members and requesters
8. **Metrics**: Monitor KPIs via Power BI dashboards

## Support and Troubleshooting

### Common Issues

1. **Power Automate Flow Not Triggering**
   - Verify flow is turned on
   - Check SharePoint permissions
   - Validate connection settings

2. **Power BI Data Not Refreshing**
   - Verify scheduled refresh settings
   - Check data source credentials
   - Validate SharePoint permissions

3. **Template Application Errors**
   - Ensure PnP PowerShell is latest version
   - Verify site collection administrator rights
   - Check for naming conflicts

## Governance and Maintenance

### Quarterly Reviews
- Review ARB process effectiveness
- Update compliance mappings
- Validate Power BI metrics
- Update documentation

### Annual Reviews
- Major framework updates
- Template version updates
- Process optimization
- Training refresh

## References

- [TOGAF® Standard, Version 9.2](https://www.opengroup.org/togaf)
- [ITIL® 4 Framework](https://www.axelos.com/best-practice-solutions/itil)
- [NIST SP 800-53 Rev. 5](https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final)
- [FedRAMP Documentation](https://www.fedramp.gov/)
- [Microsoft Power Platform Documentation](https://docs.microsoft.com/power-platform/)
- [SharePoint PnP](https://pnp.github.io/)

## Version History

- **v1.0**: Initial template release
  - Complete SharePoint site template
  - Power Automate workflows
  - Power BI dashboards
  - Framework documentation
