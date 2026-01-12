using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClassLibrary.Shared;
using MyNamespace;
using Newtonsoft.Json.Linq;
using Refit;
using Refit.Implementation;

namespace RefitSandBox
{
    public interface IUserApi
    {
        [Get("/users/{id}")]
        Task<dynamic> GetUserAsync(int id);

        [Post("/users")]
        Task CreateUserAsyn([Body] User user);
    }

    public interface IAgreementAPITest
    {
        [Get("/agreementservice/api/v1/api/payroll-providers/{payroll_provider_key}")]
        Task<object> GetAgreementAsync(string payroll_provider_key);
    }

    public interface IGetCompany
    {
        [Get("/api/v1/Company/Get/{id}")]
        Task<object> GetCompanyAsync(int id);
    }
    

    public interface IAdvisorDetails 
    {
        [Post("/api/Advisor/UpsertAdvisorRepresentative")]
        [Headers("Content-Type: application/json")]
        Task<object> CreateAdvisorDetailsAsync([Body] object advisor);
    }

    public interface IPlanDetailsSave
    {
        [Post("/api/BasicPlanDetails/SaveBasicPlanDetails")]
        [Headers("Content-Type: application/json")]
        Task<object> CreateNewPlanAsync([Body] PlanDetailsViewModel planModel);


        [Post("/api/Sponsor/SaveSponsor")]
        Task<object> SavePlanSponsor([Body] SponsorViewModel sponsor);

        [Get("/api/ClearingPartner/GetClearingPartner/{id}")]
        Task<object> GetClearingPartnersId(int id);

        [Post("/api/ClearingPartner/UpsertPlanWithClearingPartnerAccount")]
        Task<object> AddClearingPartnerToPlan([Body] PlanWithClearingPartnerViewModel clearingPartnerPlanMapping);

        [Post("/api/v1/EligibleRule/SavePlanAmendmentEligibleRule")]
        [Headers("Accept: */*", "Content-Type: application/json-patch+json")]
        Task<object> SavePlanAmendmentEligibleRule([Body] EligibilityRuleViewModel eligibilityRuleViewModel);

        [Post("/api/EntryDate/SaveEntryDate")]
        Task<object> SaveEntryDate([Body] EntryDateRuleViewModel entryDateRuleViewModel);

        [Post("/api/Source/SaveSource")]
        Task<object> SaveSource([Body] SourceViewModel sourceViewModel);

        [Post("/api/Compensation/SaveCompensation")]
        Task<object> SaveCompensation([Body] CompensationViewModel compensationViewModel);

        [Post("/api/v1/Plan/UpdatePlanStatus")]
        Task<object> UpdatePlanStatus([Body] UpdatePlanStatusViewModel updatePlanStatus);

        [Get("/api/Source/ListSource/{id}")]
        Task<object> ListSource(int id);

        [Post("/api/Investment/AddInvestmentsToPlan")]
        Task<object> AddInvestmentsToPlan([Body] AddInvestmentsInput addInvestmentInput);

        [Get("/api/Investment/GetInvestmentListByPlanId/{planId}")]
        Task<object> GetInvestmentListByPlanId(string planId);

        [Post("/api/Enrollment/SaveEnrollmentSetting")]
        Task<object> SaveEnrollmentSettings([Body] EnrollmentViewModel enrollmentViewModel);

        [Get("/api/Funding/ListFunding/{planId}")]
        Task<object> ListFunding(string planId);

        [Post("/api/Funding/SaveFunding")]
        Task<object> SaveFunding([Body] FundingViewModel fundingViewModel);

        [Post("/api/Loan/SaveLoan")]
        Task<object> SaveLoan([Body] LoanSettingViewModel loan);

        [Post("/api/Vesting/SaveVesting")]
        Task<object> SaveVesting([Body] VestingViewModel vesting);

        [Post("/api/PlanYOS/SavePlanYOS")]
        Task<object> SavePlanYOSAsync([Body] YearsOfServiceViewModel yearsOfServiceViewModel);

        [Post("/api/Withdrawal/SaveWithdrawal")]
        Task<object> SaveWithdrawalAsync([Body] WithdrawalViewModel withdrawalViewModel);

        [Post("/api/Rollover/SaveRollover")]
        Task<object> SaveRollOverAsync([Body] RolloverViewModel rolloverViewModel);

        [Post("/api/Transfer/SaveTransfer")]
        Task<object> SaveTransferAsync([Body] TransferViewModel transferViewModel);

        [Post("/api/v1/Plan/SaveSourceLimits")]
        Task<object> SaveSourceLimitsAsync([Body] SourceLimitsViewModel sourceLimitsViewModel);
    }

    public interface ICompanyDetails
    {
        [Post("/api/v1/Company")]
        Task<object> CreateNewCompanyAsync([Body] CompanyViewModel companyViewModel);

        [Post("/api/v1/Company/SaveRecordKeepers")]
        Task<object> SaveRecordKeepersAsync([Body] SaveRecordKeeperViewModel saveRecordKeeperViewModel);

        [Get("/api/v1/Company/GetRecordKeepers")]
        Task<ICollection<RecordKeeper>> GetRecordKeepers();

    }

    public interface IPayrollFileUpload
    {
        [Post("/api/v1/Payroll/PayrollAndCensusFileUpload")]
        Task<object> UploadCombinedFileAsync([Body] MultipartFormDataContent form);
    }

    public interface ITradeOrderFileUpload
    {
        [Post("/api/v1/Excalibur/UploadFile")]
        Task<string> UploadFile([Body] MultipartFormDataContent content);

        [Get("/api/v1/Trade/GetParticipantAccountBalanceByPlan")]
        Task<AccountBalanceByPlanResponse> GetParticipantAccountBalanceByPlan(
        [AliasAs("planId")] string planId,
        [AliasAs("participantId")] string participantId,
        [AliasAs("date")] string date);
    }

    public interface IInvestment
    {
        [Post("/api/v1/Investment/AddMasterInvestment")]
        Task<object> AddMasterInvestment([Body] InvestmentViewModel masterInvestment);

        [Post("/api/v1/Investment/GetMasterInvestmentBySearchCriteria")]
        Task<JArray> GetMasterInvestmentBySearchCriteria([Body] MasterInvestmentSearchModel masterInvestmentSearch);
    }
    public interface IPayroll
    {
        [Post("/api/v1/Payroll/GetUploadedFilesBasedOnSearchCriteria")]
        Task<object> GetUploadedFilesBasedOnSearchCriteria([Body] UploadedFileInformationDetails body);

        [Get("/api/v1/Payroll/GetFileInformation/{fileId}")]
        Task<FileInformationDetails> GetFileInformation(string fileId);

        [Post("/api/v1/Payroll/AcceptAllWarningsInaFile/{fileId}")]
        Task<bool> AcceptAllWarningsInaFile(string fileId);

        [Get("/api/v1/Payroll/FinalSubmit/{fileId}/{fileType}")]
        Task<FinalSumbitResult> FinalSubmit(string fileId, string fileType);

        [Post("/api/v1/Payroll/SaveFundingDetailsByPlan")]
        Task<dynamic> SaveFundingDetailsByPlan([Body] FundingByPlanViewModel fundingByPlan);

        [Post("/api/v1/Payroll/ConfirmFunds")]
        Task<dynamic> ConfirmFunds([Body] ConfirmFundsViewModel confirmFunds);

        [Get("/api/v1/Payroll/GetAwaitingFundingDetailsByPlan/{fileId}/{planId}")]
        Task<FundingByPlanViewModel> GetAwaitingFundingDetailsByPlan(string fileId, string planId);

        [Get("/api/v1/TradeGeneration/GenerateConsoliation")]
        Task<object> GenerateConsolidation();

        

        [Post("/api/v1/Payroll/GetEmployeesBySearchCriteria")]
        Task<GetEmployeesBySearchCriteriaResult> GetEmployeesBySearchCriteria(SearchCriterias search);
    }

    public interface IEmployee
    {
        [Get("/api/v1/Payroll/GetEmployee/{employeeId}")]
        Task<object> GetEmployee(string employeeId);

        [Post("/api/v1/Payroll/UpdateExistingEmployee")]
        Task<AddEmployeeResult> UpdateExistingEmployee([Body] PayrollEmployeeViewModel employee);
    }
    public interface ILoan
    {
        [Post("/api/v1/Loan/SaveInprogressLoanRequest")]
        Task<dynamic> SaveInprogressLoanRequest(EmployeeLoanViewModel loanViewModel);

        [Post("/api/v1/Loan/ApproveLoan/{id}")]
        Task<bool> ApproveLoan(string id);

        [Get("/api/v1/TradeGeneration/GenerateLoan/23%3A59")]
        Task<GetAllApprovedLoansResult> GenerateLoan();

        [Get("/api/v1/Loan/GetEmployeePlanLoans/{employeeId}")]
        Task<GetEmployeeEligiblePlanLoansResult> GetEmployeePlanLoans(string employeeId);

        [Post("/api/v1/Loan/SaveLoanRefinance")]
        Task<object> SaveLoanRefinance([Body] LoanRefinanceViewModel loanRefinance);

        [Get("/api/v1/Loan/GetAmortizationSchedule/{loanId}")]
        Task<System.Collections.Generic.ICollection<ScheduledRepayment>> GetAmortizationSchedule(string loanId);

        [Get("/api/v1/Loan/CheckAndUpdateLoanStatus/{loanId}")]
        Task<bool> CheckAndUpdateLoanStatus(string loanId);

        [Get("/api/v1/Loan/GetLoan/{Id}")]
        Task<GetLoanResult> GetLoan(string Id);
    }
    public class Advisor
    {
        public string Name { get; set; }
    }

    public class User
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
    }
}
