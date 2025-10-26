# ARB SharePoint Site Deployment Script
# PowerShell script to deploy the ARB SharePoint environment
# Requires: PnP.PowerShell module

<#
.SYNOPSIS
    Deploys the Architecture Review Board (ARB) SharePoint environment

.DESCRIPTION
    This script creates the ARB SharePoint site, lists, libraries, groups, and permissions.
    It should be run by a SharePoint administrator.

.PARAMETER TenantUrl
    The SharePoint admin center URL (e.g., https://contoso-admin.sharepoint.com)

.PARAMETER SiteUrl
    The target ARB site URL (e.g., https://contoso.sharepoint.com/sites/ARB)

.PARAMETER Owner
    The site owner email address

.EXAMPLE
    .\Deploy-ARBSite.ps1 -TenantUrl "https://contoso-admin.sharepoint.com" -SiteUrl "https://contoso.sharepoint.com/sites/ARB" -Owner "admin@contoso.com"
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$TenantUrl,
    
    [Parameter(Mandatory=$true)]
    [string]$SiteUrl,
    
    [Parameter(Mandatory=$true)]
    [string]$Owner
)

# Import required module
if (!(Get-Module -ListAvailable -Name PnP.PowerShell)) {
    Write-Host "Installing PnP.PowerShell module..." -ForegroundColor Yellow
    Install-Module -Name PnP.PowerShell -Force -AllowClobber
}

Import-Module PnP.PowerShell

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "ARB SharePoint Deployment Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Connect to SharePoint
Write-Host "Connecting to SharePoint..." -ForegroundColor Yellow
Connect-PnPOnline -Url $TenantUrl -Interactive

# Step 1: Create the site
Write-Host ""
Write-Host "Step 1: Creating ARB Communication Site..." -ForegroundColor Green
try {
    $site = New-PnPSite -Type CommunicationSite `
        -Title "Architecture Review Board" `
        -Url $SiteUrl `
        -Description "Enterprise Architecture Review Board Portal - Automated approval and governance system" `
        -Owner $Owner `
        -ErrorAction Stop
    Write-Host "✓ Site created successfully" -ForegroundColor Green
} catch {
    Write-Host "✗ Error creating site: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Site may already exist. Continuing..." -ForegroundColor Yellow
}

# Connect to the new site
Write-Host "Connecting to ARB site..." -ForegroundColor Yellow
Connect-PnPOnline -Url $SiteUrl -Interactive

# Step 2: Create SharePoint Groups
Write-Host ""
Write-Host "Step 2: Creating SharePoint Groups..." -ForegroundColor Green

$groups = @(
    @{Name="ARB Submitters"; Description="Users who can submit ARB requests"},
    @{Name="ARB Gatekeepers"; Description="Users who perform intake review"},
    @{Name="ARB Technical Reviewers"; Description="Technical review team"},
    @{Name="ARB Security Reviewers"; Description="Security review team"},
    @{Name="ARB Board Members"; Description="ARB board voting members"},
    @{Name="ARB Administrators"; Description="ARB system administrators"}
)

foreach ($group in $groups) {
    try {
        New-PnPGroup -Title $group.Name -Description $group.Description -ErrorAction SilentlyContinue
        Write-Host "  ✓ Created group: $($group.Name)" -ForegroundColor Green
    } catch {
        Write-Host "  ⚠ Group may already exist: $($group.Name)" -ForegroundColor Yellow
    }
}

# Step 3: Create Lists
Write-Host ""
Write-Host "Step 3: Creating ARB Submissions List..." -ForegroundColor Green

try {
    New-PnPList -Title "ARB Submissions" -Template GenericList -Url "Lists/ARBSubmissions" -ErrorAction SilentlyContinue
    Write-Host "  ✓ Created ARB Submissions list" -ForegroundColor Green
} catch {
    Write-Host "  ⚠ List may already exist" -ForegroundColor Yellow
}

# Add columns to ARB Submissions
Write-Host "  Adding columns to ARB Submissions..." -ForegroundColor Yellow

$columns = @(
    @{Name="SubmissionID"; Type="Text"; Required=$true; Unique=$true},
    @{Name="ProjectName"; Type="Text"; Required=$true},
    @{Name="SubmitterEmail"; Type="Text"; Required=$true},
    @{Name="SubmissionDate"; Type="DateTime"; Required=$true},
    @{Name="Status"; Type="Choice"; Required=$true; Choices=@("Draft","Submitted","In Intake Review","In Technical Review","In Security Review","In Board Review","Approved","Conditional Approval","Rejected"); Default="Draft"},
    @{Name="Priority"; Type="Choice"; Required=$false; Choices=@("Critical","High","Medium","Low"); Default="Medium"},
    @{Name="BusinessUnit"; Type="Choice"; Required=$false; Choices=@("IT Infrastructure","Application Development","Data Services","Security","Cloud Services","Enterprise Architecture","Operations","Other")},
    @{Name="ProjectType"; Type="Choice"; Required=$true; Choices=@("Infrastructure","Application","Data","Security","Cloud","Integration","Network","Other")},
    @{Name="EstimatedCost"; Type="Currency"; Required=$false},
    @{Name="ProposedStartDate"; Type="DateTime"; Required=$false},
    @{Name="TechnicalReviewer"; Type="User"; Required=$false},
    @{Name="SecurityReviewer"; Type="User"; Required=$false},
    @{Name="Gatekeeper"; Type="User"; Required=$false},
    @{Name="BoardDecisionDate"; Type="DateTime"; Required=$false},
    @{Name="Decision"; Type="Choice"; Required=$false; Choices=@("Approved","Conditional Approval","Rejected","Pending"); Default="Pending"},
    @{Name="DecisionNotes"; Type="Note"; Required=$false},
    @{Name="SLAStatus"; Type="Choice"; Required=$false; Choices=@("On Track","At Risk","Breached"); Default="On Track"}
)

foreach ($column in $columns) {
    try {
        if ($column.Type -eq "Choice") {
            Add-PnPField -List "ARB Submissions" -DisplayName $column.Name -InternalName $column.Name -Type Choice -Choices $column.Choices -Required:$column.Required -AddToDefaultView -ErrorAction SilentlyContinue
        } elseif ($column.Type -eq "User") {
            Add-PnPField -List "ARB Submissions" -DisplayName $column.Name -InternalName $column.Name -Type User -Required:$column.Required -AddToDefaultView -ErrorAction SilentlyContinue
        } elseif ($column.Type -eq "DateTime") {
            Add-PnPField -List "ARB Submissions" -DisplayName $column.Name -InternalName $column.Name -Type DateTime -Required:$column.Required -AddToDefaultView -ErrorAction SilentlyContinue
        } elseif ($column.Type -eq "Currency") {
            Add-PnPField -List "ARB Submissions" -DisplayName $column.Name -InternalName $column.Name -Type Currency -Required:$column.Required -AddToDefaultView -ErrorAction SilentlyContinue
        } elseif ($column.Type -eq "Note") {
            Add-PnPField -List "ARB Submissions" -DisplayName $column.Name -InternalName $column.Name -Type Note -Required:$column.Required -AddToDefaultView -ErrorAction SilentlyContinue
        } else {
            Add-PnPField -List "ARB Submissions" -DisplayName $column.Name -InternalName $column.Name -Type Text -Required:$column.Required -AddToDefaultView -ErrorAction SilentlyContinue
        }
        Write-Host "    ✓ Added column: $($column.Name)" -ForegroundColor Green
    } catch {
        Write-Host "    ⚠ Column may already exist: $($column.Name)" -ForegroundColor Yellow
    }
}

# Create Technical Reviews List
Write-Host ""
Write-Host "  Creating Technical Reviews List..." -ForegroundColor Green

try {
    New-PnPList -Title "Technical Reviews" -Template GenericList -Url "Lists/TechnicalReviews" -ErrorAction SilentlyContinue
    Write-Host "  ✓ Created Technical Reviews list" -ForegroundColor Green
} catch {
    Write-Host "  ⚠ List may already exist" -ForegroundColor Yellow
}

# Create Security Reviews List
Write-Host ""
Write-Host "  Creating Security Reviews List..." -ForegroundColor Green

try {
    New-PnPList -Title "Security Reviews" -Template GenericList -Url "Lists/SecurityReviews" -ErrorAction SilentlyContinue
    Write-Host "  ✓ Created Security Reviews list" -ForegroundColor Green
} catch {
    Write-Host "  ⚠ List may already exist" -ForegroundColor Yellow
}

# Step 4: Create Document Libraries
Write-Host ""
Write-Host "Step 4: Creating Document Libraries..." -ForegroundColor Green

$libraries = @(
    @{Name="ARB Submission Documents"; Url="ARBSubmissionDocs"},
    @{Name="ARB Templates"; Url="ARBTemplates"},
    @{Name="Board Decisions"; Url="BoardDecisions"}
)

foreach ($library in $libraries) {
    try {
        New-PnPList -Title $library.Name -Template DocumentLibrary -Url $library.Url -ErrorAction SilentlyContinue
        Write-Host "  ✓ Created library: $($library.Name)" -ForegroundColor Green
    } catch {
        Write-Host "  ⚠ Library may already exist: $($library.Name)" -ForegroundColor Yellow
    }
}

# Step 5: Configure Permissions
Write-Host ""
Write-Host "Step 5: Configuring Permissions..." -ForegroundColor Green

try {
    # Break role inheritance on ARB Submissions list
    Set-PnPList -Identity "ARB Submissions" -BreakRoleInheritance -CopyRoleAssignments
    
    # Set permissions for each group
    Set-PnPListPermission -Identity "ARB Submissions" -Group "ARB Submitters" -AddRole "Contribute"
    Set-PnPListPermission -Identity "ARB Submissions" -Group "ARB Gatekeepers" -AddRole "Edit"
    Set-PnPListPermission -Identity "ARB Submissions" -Group "ARB Technical Reviewers" -AddRole "Edit"
    Set-PnPListPermission -Identity "ARB Submissions" -Group "ARB Security Reviewers" -AddRole "Edit"
    Set-PnPListPermission -Identity "ARB Submissions" -Group "ARB Board Members" -AddRole "Edit"
    Set-PnPListPermission -Identity "ARB Submissions" -Group "ARB Administrators" -AddRole "Full Control"
    
    Write-Host "  ✓ Permissions configured" -ForegroundColor Green
} catch {
    Write-Host "  ⚠ Error configuring permissions: $($_.Exception.Message)" -ForegroundColor Yellow
}

# Step 6: Create Views
Write-Host ""
Write-Host "Step 6: Creating List Views..." -ForegroundColor Green

try {
    # Active Submissions view
    $query = "<Where><And><Neq><FieldRef Name='Status'/><Value Type='Choice'>Approved</Value></Neq><Neq><FieldRef Name='Status'/><Value Type='Choice'>Rejected</Value></Neq></And></Where>"
    Add-PnPView -List "ARB Submissions" -Title "Active Submissions" -Fields "SubmissionID","ProjectName","Status","Priority","SubmissionDate" -Query $query -SetAsDefault $false -ErrorAction SilentlyContinue
    Write-Host "  ✓ Created Active Submissions view" -ForegroundColor Green
} catch {
    Write-Host "  ⚠ View may already exist" -ForegroundColor Yellow
}

# Step 7: Create Navigation
Write-Host ""
Write-Host "Step 7: Creating Navigation..." -ForegroundColor Green

$navItems = @(
    @{Title="Home"; Url="/sites/ARB"},
    @{Title="Submit Request"; Url="/sites/ARB/Lists/ARBSubmissions/NewForm.aspx"},
    @{Title="My Submissions"; Url="/sites/ARB/Lists/ARBSubmissions/MyItems.aspx"},
    @{Title="Dashboards"; Url="/sites/ARB/SitePages/Dashboards.aspx"},
    @{Title="Templates"; Url="/sites/ARB/ARBTemplates"},
    @{Title="Help"; Url="/sites/ARB/SitePages/Help.aspx"}
)

foreach ($item in $navItems) {
    try {
        Add-PnPNavigationNode -Location TopNavigationBar -Title $item.Title -Url $item.Url -ErrorAction SilentlyContinue
        Write-Host "  ✓ Added navigation item: $($item.Title)" -ForegroundColor Green
    } catch {
        Write-Host "  ⚠ Navigation item may already exist: $($item.Title)" -ForegroundColor Yellow
    }
}

# Step 8: Upload Templates (if template files exist)
Write-Host ""
Write-Host "Step 8: Uploading Templates..." -ForegroundColor Green
Write-Host "  ⚠ Manual step: Upload template files to ARB Templates library" -ForegroundColor Yellow

# Summary
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Deployment Summary" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "✓ ARB site created/configured" -ForegroundColor Green
Write-Host "✓ SharePoint groups created" -ForegroundColor Green
Write-Host "✓ Lists and libraries created" -ForegroundColor Green
Write-Host "✓ Permissions configured" -ForegroundColor Green
Write-Host "✓ Navigation configured" -ForegroundColor Green
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host "1. Add users to SharePoint groups" -ForegroundColor White
Write-Host "2. Upload template files to ARB Templates library" -ForegroundColor White
Write-Host "3. Configure Power Automate flows" -ForegroundColor White
Write-Host "4. Set up Power BI dashboards" -ForegroundColor White
Write-Host "5. Configure Microsoft Forms" -ForegroundColor White
Write-Host "6. Test the environment" -ForegroundColor White
Write-Host ""
Write-Host "Site URL: $SiteUrl" -ForegroundColor Cyan
Write-Host ""

Disconnect-PnPOnline
