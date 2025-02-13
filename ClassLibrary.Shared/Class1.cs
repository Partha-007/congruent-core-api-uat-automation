using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace ClassLibrary.Shared
{
    public class CompanyModel
    {
        public Company company { get; set; }
        public bool isSuccessful { get; set; }
        public List<ErrorMessage> errorMessages { get; set; }
    }

    public class Company
    {
        public int id { get; set; }
        public string name { get; set; }
        public string address1 { get; set; }
        public string address2 { get; set; }
        public string country { get; set; }
        public string state { get; set; }
        public string city { get; set; }
        public string postalCode { get; set; }
        public string sponsorPostalCode { get; set; }
        public string taxEIN { get; set; }
        public string email { get; set; }
        public string phoneNumber { get; set; }
        public string website { get; set; }
        public int businessType { get; set; }
        public int taxedAs { get; set; }
        public string stateOfIncorporation { get; set; }
        public string sicCode { get; set; }
        public string businessCode { get; set; }
        public int operatesAs { get; set; }
        public DateTime companyStartDate { get; set; }
        public int fisicalYearMonth { get; set; }
        public int fisicalYearDay { get; set; }
        public int modeOfHours { get; set; }
        public int modeOfCompensation { get; set; }
        public int modeOfContribution { get; set; }
        public bool isPayrollCalenderRequire { get; set; }
        public bool isLatePayrollApplicable { get; set; }
        public bool isPayrollConfirmationApplicable { get; set; }
        public bool isRehireDateLogicApplicable { get; set; }
        public bool isFileGenerationRequire { get; set; }
        public bool isNonTrackedLoanApplicable { get; set; }
        public string permanentRecordKeeperCompanyId { get; set; }
        public string currentRecordKeeperCompanyId { get; set; }
        public string employmentStatus { get; set; }
        public object payrollFrequencies { get; set; }
        public object classifications { get; set; }
        public object payrollCalendars { get; set; }
        public object compensationCategories { get; set; }
        public int tenantId { get; set; }
        public string logo { get; set; }
        public string customData { get; set; }
        public int recordKeeperId { get; set; }
        public string extendedField { get; set; }
    }

    public class ErrorMessage
    {
        public string controlName { get; set; }
        public string message { get; set; }
        public string errorCode { get; set; }
        public string errorType { get; set; }
    }
}


