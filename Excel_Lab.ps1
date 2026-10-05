# ==========================================================
# Excel Lab - Import and Analyze Employee Data
# Author: Rajan Josh Dela Cruz
# October 5, 2026
#https://github.com/rjnjsh26/Powershell_Scripts
# ==========================================================

# Import the ImportExcel PowerShell module.
Import-Module ImportExcel

# Path to the Excel workbook.
$excelPath = ".\Excel-Lab-Completed.xlsx"

# Check whether the workbook exists before continuing.
if (-not (Test-Path $excelPath)) {
    Write-Host "ERROR: Excel-Lab-Completed.xlsx was not found." -ForegroundColor Red
    Write-Host "Put the Excel file in the same folder as this script." -ForegroundColor Yellow
    exit
}

Write-Host "Excel file found: $excelPath" -ForegroundColor Green

# Import the Data worksheet and save it in the $employees variable.
$employees = Import-Excel -Path $excelPath -WorksheetName "Data"

# Display all imported employee data.
Write-Host "`n===== IMPORTED EMPLOYEE DATA =====" -ForegroundColor Cyan
$employees | Format-Table ID, Name, Department, Salary, 'Start Date', Bonus, 'Total Compensation' -AutoSize

# Display properties created from the Excel column headings.
Write-Host "`n===== EXCEL COLUMN PROPERTIES =====" -ForegroundColor Cyan
$employees | Get-Member -MemberType NoteProperty

# Count the employees.
$employeeCount = $employees.Count

# Calculate salary statistics.
$averageSalary = ($employees | Measure-Object -Property Salary -Average).Average
$totalSalary = ($employees | Measure-Object -Property Salary -Sum).Sum
$highestSalary = ($employees | Measure-Object -Property Salary -Maximum).Maximum
$lowestSalary = ($employees | Measure-Object -Property Salary -Minimum).Minimum

# Display salary statistics.
Write-Host "`n===== SALARY STATISTICS =====" -ForegroundColor Cyan
Write-Host "Total Employees: $employeeCount"
Write-Host "Average Salary:  `$($averageSalary.ToString('N2'))"
Write-Host "Total Payroll:   `$($totalSalary.ToString('N2'))"
Write-Host "Highest Salary:  `$($highestSalary.ToString('N2'))"
Write-Host "Lowest Salary:   `$($lowestSalary.ToString('N2'))"

# Filter employees in the IT department.
Write-Host "`n===== IT DEPARTMENT EMPLOYEES =====" -ForegroundColor Cyan
$employees |
    Where-Object { $_.Department -eq "IT" } |
    Format-Table Name, Department, Salary, Bonus, 'Total Compensation' -AutoSize

# Sort all employees from highest to lowest salary.
Write-Host "`n===== EMPLOYEES SORTED BY SALARY (HIGH TO LOW) =====" -ForegroundColor Cyan
$employees |
    Sort-Object -Property Salary -Descending |
    Format-Table Name, Department, Salary -AutoSize

# Show employees with salaries greater than $75,000.
Write-Host "`n===== EMPLOYEES EARNING MORE THAN `$75,000 =====" -ForegroundColor Cyan
$employees |
    Where-Object { $_.Salary -gt 75000 } |
    Format-Table Name, Department, Salary -AutoSize

# Group employees by department.
Write-Host "`n===== DEPARTMENT SUMMARY =====" -ForegroundColor Cyan
$employees |
    Group-Object -Property Department |
    ForEach-Object {
        [PSCustomObject]@{
            Department = $_.Name
            EmployeeCount = $_.Count
            TotalSalary = ($_.Group | Measure-Object -Property Salary -Sum).Sum
            AverageSalary = ($_.Group | Measure-Object -Property Salary -Average).Average
        }
    } |
    Sort-Object Department |
    Format-Table Department, EmployeeCount,
        @{Label = "Total Salary"; Expression = { '$' + $_.TotalSalary.ToString('N2') }},
        @{Label = "Average Salary"; Expression = { '$' + $_.AverageSalary.ToString('N2') }} -AutoSize

# Import the PivotTable worksheet.
Write-Host "`n===== PIVOTTABLE WORKSHEET =====" -ForegroundColor Cyan
$departmentSummary = Import-Excel -Path $excelPath -WorksheetName "PivotTable"
$departmentSummary | Format-Table -AutoSize

Write-Host "`n===== SCRIPT COMPLETED SUCCESSFULLY =====" -ForegroundColor Green