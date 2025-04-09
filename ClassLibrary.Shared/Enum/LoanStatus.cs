using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Shared.Enum
{
    public class LoanStatus
    {
        public enum LoanStatusesTest
        {
            InProgress = 1,
            Deleted,
            AwaitingApproval,
            Rejected,
            Suspended,
            Approved,
            AwaitingTrade,
            Active,
            Delinquent,
            DefaultDeemedDistribution,
            DefaultBenefitOffset,
            Closed,
            RefinancingRequestAwaitingApproval,
            ReAmortizationRequestAwaitingApproval,
            RefinancingRequestAwaitingTrade,
            ReAmortizationRequestAwaitingTrade,
            ClosedByRefinancing,
            ClosedByReAmortization,
            ClosedBySuspension,
            DocusignVerificationInProgress,
            DocusigneSignatureRejected,
            DocusigneSignatureVoided,
            TradeRejected,
            TradeCompleted,
            AwaitingSettlement,
            ReAmortizeDocusignVerificationInProgress,
            ReAmortizeDocusignSignatureRejected,
            ReAmortizeDocusignSignatureVoided,
            ReFinanceDocusignVerificationInProgress,
            ReFinanceDocusignSignatureRejected,
            ReFinanceDocusignSignatureVoided
        }
    }
    
}
