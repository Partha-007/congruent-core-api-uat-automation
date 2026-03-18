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

namespace ClassLibrary.Shared.RefitHelper
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

    public interface IClearingPartner
    {
        [Get("/api/ClearingPartner/GetClearingPartners")]
        Task<object> GetMasterClearingPartnersId();

        [Get("/api/ClearingPartner/GetClearingPartner/{id}")]
        Task<object> GetMasterClearingPartnerAccounts(int id);

        [Post("/api/ClearingPartner/UpsertClearingPartnerAccount")]
        Task<object> AddClearingPartnerAccount([Body] ClearingPartnerViewModel clearingPartnerPlanMapping);

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

        [Get("/api/ClearingPartner/GetPlanAssociatedClearingPartnerAccounts/{id}")]
        Task<object> GetPlanAssociatedClearingPartnerAccounts(int id);

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

        [Post("/api/v1/Plan/SaveForfeitureSetting")]
        Task<object> SaveForfeitureSettingAsync([Body] SaveForfeitureSettingViewModel saveForfeitureSettingView);
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

        [Post("/api/v1/Payroll/PayrollAndCensusFileUploadTest")]
        Task<PayrollAndCensusFileUploadTestResult> UploadCombinedFileTestAsync([Body] MultipartFormDataContent form);

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

        [Post("/api/v1/TradeOutboundFileGeneration/GenerateFile")]
        Task<object> GenerateFileAsync(OutboundFileGeneration outboundFileGeneration);

        [Post("/api/v1/Trade/GetEmployeeTransactionView")]

        Task<GetEmployeeTransactionViewResult> GetEmployeeTransactionViewAsync([Body] GetEmployeeTransactionViewModel employeeTransactionViewRequest);
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

        [Get("/api/v1/TradeOutboundFileGeneration/GenerateFile")]
        Task<object> GenerateOutboundFile();


        [Post("/api/v1/Payroll/GetEmployeesBySearchCriteria")]
        Task<GetEmployeesBySearchCriteriaResult> GetEmployeesBySearchCriteria(SearchCriterias search);

        [Post("/api/v1/Payroll/SaveFundingDetailsByFile")]
        Task<bool> SaveFundingDetailsByFileAsync([Body] int body);
    }

    public interface IEmployee
    {
        [Get("/api/v1/Payroll/GetEmployee/{employeeId}")]
        Task<object> GetEmployee(string employeeId);

        [Post("/api/v1/Payroll/UpdateExistingEmployee")]
        Task<AddEmployeeResult> UpdateExistingEmployee([Body] PayrollEmployeeViewModel employee);

        [Post("/api/v1/Payroll/SaveEmployee")]
        Task<object> SaveEmployeeAsync([Body] PayrollEmployeeViewModel employee);

        [Post("/api/v1/Payroll/AddBeneficary")]
        Task<object> AddBeneficaryAsync([Body] BeneficiaryInformation beneficiary);

    }
    public interface ILoan
    {
        [Post("/api/v1/Loan/SaveInprogressLoanRequest")]
        Task<dynamic> SaveInprogressLoanRequest(EmployeeLoanViewModel loanViewModel);

        [Post("/api/v1/Loan/SubmitLoanRequest")]
        Task<SubmitLoanRequestResult> SubmitLoanRequest(SubmitLoanRequestViewModel submitLoanRequestViewModel);

        [Post("/api/v1/Loan/ProcessLoanDisbursement")]
        Task<bool> ProcessLoanDisbursement([Body] ProcessLoanDisbursementViewModel processLoanDisbursementViewModel);

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

    public interface ITransfer
    {
        [Post("/api/v1/Transfer/SaveTransferDetailsForAdmin")]

        Task<object> SaveTransferDetailsForAdminAsync(TransferDetailsForAdminViewModel transferDetails);
    }

    public interface IRolloverIn
    {
        [Post("/api/RolloverIn/SaveRolloverInRequest")]
        Task<SaveRolloverInRequestResult> SaveRolloverInRequestAsync(RollOverInRequestDetails rollOverInRequestDetails);

        [Post("/api/RolloverIn/ApproveOrRejectRolloverInRequest")]
        Task<bool> ApproveOrRejectRolloverInRequestAsync(ApproveOrRejectRolloverInRequest approveOrRejectRolloverInRequest);
    }

    public interface IAdjustments
    {
        [Post("/api/v1/Adjustment/SaveBasicAdjustmentDetails")]
        Task<SaveBasicDetailsResult> SaveBasicAdjustmentDetailsAsync(BasicDetails basicDetails);

        [Post("/api/v1/Adjustment/SaveAdjustmentDetails")]
        Task<SaveAdjustmentDetailsResult> SaveAdjustmentDetailsAsync(AdjustmentDetails adjustmentDetails);

        [Get("/api/v1/Adjustment/SaveAdjustmentSummaryById/{Id}")]
        Task<SaveAdjustmentSummaryResult> SaveAdjustmentSummaryByIdAsync(int Id);
    }

    public interface IFee
    {
        [Post("/api/v1/Fee/SaveFeeDetails")]
        Task<SaveFeeDetailsResult> SaveFeeDetailsAsync(BasicFeeDetails basicFeeDetails);

        [Post("/api/v1/Fee/SaveFeeCalculationDetails")]
        Task<SaveFeeCalculationDetailsResult> SaveFeeCalculationDetailsAsync(CalculationDetails calculationDetails);

        [Post("/api/v1/Fee/AddFeeApplicableTo")]
        Task<AddFeeApplicableToResult> AddFeeApplicableToAsync(FeeApplicableTo feeApplicableTo);

        [Post("/api/v1/Fee/AddFeeSchedule")]
        Task<AddFeeScheduleResult> AddFeeScheduleAsync(FeeSchedule body);

        [Get("/api/v1/Fee/SaveSummaryDetails/{id}")]
        Task<SaveSummaryDetailsResult> SaveSummaryDetailsAsync(int id);
    }

    public interface IForfeiture
    {
        [Post("/api/v1/Forfeiture/TriggerFeitureWhen5YearBIS")]
        Task<object> TriggerFeitureWhen5YearBISAsync();
    }

    public interface IFundSwitch
    {
        [Post("/api/v1/FundSwitch/SaveFundSwitchDetails")]
        Task<SaveFundSwitchDetailsResult> SaveFundSwitchDetailsAsync(FundSwitchDetails fundSwitchDetails);

        [Get("/api/v1/FundSwitch/UpdateFundSwitchStatus/{status}/{transactionId}")]
        Task<bool> UpdateFundSwitchStatusAsync(int status, string transactionId);
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
