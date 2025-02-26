using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClassLibrary.Shared;
using MyNamespace;
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
    }

    public interface ICompanyDetails
    {
        [Post("/api/v1/Company")]
        Task<object> CreateNewCompanyAsync([Body] CompanyViewModel companyViewModel);
    }

    public interface IPayrollFileUpload
    {
        [Post("/api/v1/Payroll/PayrollAndCensusFileUploadTest")]
        Task<object> UploadCombinedFileAsync([Body] MultipartFormDataContent form);
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
